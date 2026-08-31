import re
import secrets

from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import check_password, make_password
from django.core.exceptions import ValidationError
from django.core.validators import MaxValueValidator, MinValueValidator
from django.db import models, transaction
from django.utils import timezone


User = get_user_model()


CONTACT_DETAIL_PATTERNS = {
    "email": re.compile(r"\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b", re.IGNORECASE),
    "phone": re.compile(r"(?<!\w)(?:\+?234|0)?(?:[\s.-]?\d){10,13}(?!\w)"),
}


def detect_contact_details(text):
    matches = {}
    for kind, pattern in CONTACT_DETAIL_PATTERNS.items():
        found = sorted(set(pattern.findall(text or "")))
        if found:
            matches[kind] = found
    return matches


class TimestampedModel(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True


class UserProfile(TimestampedModel):
    class Role(models.TextChoices):
        CUSTOMER = "customer", "Customer"
        PROVIDER = "provider", "Provider"
        ADMIN = "admin", "Admin"

    class Status(models.TextChoices):
        ACTIVE = "active", "Active"
        SUSPENDED = "suspended", "Suspended"
        DEACTIVATED = "deactivated", "Deactivated"

    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="profile")
    role = models.CharField(max_length=20, choices=Role.choices, default=Role.CUSTOMER)
    phone_number = models.CharField(max_length=32, blank=True)
    city = models.CharField(max_length=80, blank=True)
    sub_location = models.CharField(max_length=120, blank=True)
    account_status = models.CharField(max_length=20, choices=Status.choices, default=Status.ACTIVE)
    is_nysc_member = models.BooleanField(default=False)
    is_new_mover = models.BooleanField(default=False)
    suspended_reason = models.TextField(blank=True)
    suspended_at = models.DateTimeField(null=True, blank=True)

    def __str__(self):
        return f"{self.user.get_full_name() or self.user.username} ({self.role})"


class ServiceCategory(TimestampedModel):
    class Status(models.TextChoices):
        ACTIVE = "active", "Active"
        DRAFT = "draft", "Draft"
        ARCHIVED = "archived", "Archived"

    name = models.CharField(max_length=120)
    slug = models.SlugField(max_length=140, unique=True)
    description = models.TextField(blank=True)
    parent = models.ForeignKey(
        "self",
        on_delete=models.PROTECT,
        related_name="children",
        null=True,
        blank=True,
    )
    status = models.CharField(max_length=20, choices=Status.choices, default=Status.ACTIVE)

    class Meta:
        verbose_name_plural = "service categories"
        ordering = ["parent__name", "name"]

    def __str__(self):
        return self.name


class ProviderProfile(TimestampedModel):
    class VerificationStatus(models.TextChoices):
        DRAFT = "draft", "Draft"
        PENDING = "pending", "Pending Approval"
        VERIFIED = "verified", "Verified"
        REJECTED = "rejected", "Rejected"
        SUSPENDED = "suspended", "Suspended"

    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name="provider_profile")
    business_name = models.CharField(max_length=160)
    bio = models.TextField(blank=True)
    city = models.CharField(max_length=80)
    service_area = models.CharField(max_length=160, blank=True)
    verification_status = models.CharField(
        max_length=20,
        choices=VerificationStatus.choices,
        default=VerificationStatus.DRAFT,
    )
    services = models.ManyToManyField(ServiceCategory, through="ProviderService", related_name="providers")
    average_rating = models.DecimalField(max_digits=3, decimal_places=2, default=0)
    completed_jobs_count = models.PositiveIntegerField(default=0)
    approved_at = models.DateTimeField(null=True, blank=True)
    approved_by = models.ForeignKey(
        User,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="approved_providers",
    )
    rejection_reason = models.TextField(blank=True)
    suspended_reason = models.TextField(blank=True)

    class Meta:
        ordering = ["business_name"]

    def __str__(self):
        return self.business_name


class ProviderService(TimestampedModel):
    provider = models.ForeignKey(ProviderProfile, on_delete=models.CASCADE)
    category = models.ForeignKey(ServiceCategory, on_delete=models.PROTECT)
    starting_price = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)
    is_active = models.BooleanField(default=True)

    class Meta:
        constraints = [
            models.UniqueConstraint(fields=["provider", "category"], name="unique_provider_service")
        ]

    def __str__(self):
        return f"{self.provider} - {self.category}"


class IdentityVerification(TimestampedModel):
    class DocumentType(models.TextChoices):
        GOVERNMENT_ID = "government_id", "Government ID"
        SELFIE = "selfie", "Selfie"
        BUSINESS_REGISTRATION = "business_registration", "Business Registration"
        CERTIFICATION = "certification", "Certification"

    class Status(models.TextChoices):
        PENDING = "pending", "Pending"
        APPROVED = "approved", "Approved"
        REJECTED = "rejected", "Rejected"

    provider = models.ForeignKey(ProviderProfile, on_delete=models.CASCADE, related_name="identity_documents")
    document_type = models.CharField(max_length=40, choices=DocumentType.choices)
    document_reference = models.CharField(max_length=255)
    status = models.CharField(max_length=20, choices=Status.choices, default=Status.PENDING)
    reviewed_by = models.ForeignKey(
        User,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="reviewed_identity_documents",
    )
    reviewed_at = models.DateTimeField(null=True, blank=True)
    rejection_reason = models.TextField(blank=True)

    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return f"{self.provider} - {self.document_type}"


class ServiceRequest(TimestampedModel):
    class Status(models.TextChoices):
        PENDING = "pending", "Pending"
        QUOTED = "quoted", "Quoted"
        SCHEDULED = "scheduled", "Scheduled"
        IN_PROGRESS = "in_progress", "In Progress"
        COMPLETED = "completed", "Completed"
        CANCELLED = "cancelled", "Cancelled"
        DISPUTED = "disputed", "Disputed"

    customer = models.ForeignKey(User, on_delete=models.PROTECT, related_name="service_requests")
    provider = models.ForeignKey(
        ProviderProfile,
        on_delete=models.PROTECT,
        related_name="service_requests",
        null=True,
        blank=True,
    )
    category = models.ForeignKey(ServiceCategory, on_delete=models.PROTECT, related_name="service_requests")
    title = models.CharField(max_length=160)
    description = models.TextField()
    city = models.CharField(max_length=80)
    address = models.TextField(blank=True)
    preferred_start_at = models.DateTimeField(null=True, blank=True)
    budget_amount = models.DecimalField(max_digits=12, decimal_places=2, null=True, blank=True)
    accepted_quote = models.OneToOneField(
        "Quote",
        on_delete=models.SET_NULL,
        related_name="accepted_for_request",
        null=True,
        blank=True,
    )
    status = models.CharField(max_length=20, choices=Status.choices, default=Status.PENDING)
    anti_circumvention_acknowledged = models.BooleanField(default=False)
    cancellation_policy_acknowledged = models.BooleanField(default=False)
    cancellation_reason = models.TextField(blank=True)
    completed_at = models.DateTimeField(null=True, blank=True)
    cancelled_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return f"{self.title} - {self.customer}"

    @property
    def is_platform_job(self):
        return bool(self.accepted_quote_id and hasattr(self, "payment"))

    @property
    def is_rating_eligible(self):
        return self.status == self.Status.COMPLETED and self.is_platform_job

    def clean(self):
        if self.status == self.Status.CANCELLED and not self.cancellation_reason:
            raise ValidationError({"cancellation_reason": "Cancellation requires a reason."})
        if self.accepted_quote and self.provider_id != self.accepted_quote.provider_id:
            raise ValidationError({"accepted_quote": "Accepted quote must belong to the selected provider."})

    def mark_completed_with_pin(self, raw_pin):
        if not hasattr(self, "job_pin") or not self.job_pin.check_pin(raw_pin):
            raise ValidationError("Invalid job PIN.")
        self.status = self.Status.COMPLETED
        self.completed_at = timezone.now()
        self.job_pin.verified_at = self.completed_at
        self.job_pin.save(update_fields=["verified_at", "updated_at"])
        self.save(update_fields=["status", "completed_at", "updated_at"])
        if hasattr(self, "payment") and self.payment.status == PlatformPayment.Status.HELD:
            self.payment.status = PlatformPayment.Status.RELEASE_PENDING
            self.payment.release_eligible_at = timezone.now()
            self.payment.save(update_fields=["status", "release_eligible_at", "updated_at"])


class Quote(TimestampedModel):
    class Status(models.TextChoices):
        SENT = "sent", "Sent"
        ACCEPTED = "accepted", "Accepted"
        REJECTED = "rejected", "Rejected"
        WITHDRAWN = "withdrawn", "Withdrawn"
        EXPIRED = "expired", "Expired"

    service_request = models.ForeignKey(ServiceRequest, on_delete=models.CASCADE, related_name="quotes")
    provider = models.ForeignKey(ProviderProfile, on_delete=models.PROTECT, related_name="quotes")
    amount = models.DecimalField(max_digits=12, decimal_places=2)
    platform_fee = models.DecimalField(max_digits=12, decimal_places=2, default=0)
    currency = models.CharField(max_length=3, default="NGN")
    notes = models.TextField(blank=True)
    expires_at = models.DateTimeField(null=True, blank=True)
    status = models.CharField(max_length=20, choices=Status.choices, default=Status.SENT)
    accepted_at = models.DateTimeField(null=True, blank=True)

    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return f"{self.provider} quote for {self.service_request}"

    def clean(self):
        if self.amount <= 0:
            raise ValidationError({"amount": "Quote amount must be greater than zero."})
        if self.platform_fee < 0:
            raise ValidationError({"platform_fee": "Platform fee cannot be negative."})
        if self.provider.verification_status != ProviderProfile.VerificationStatus.VERIFIED:
            raise ValidationError({"provider": "Only verified providers can quote jobs."})
        if self.service_request.status in [ServiceRequest.Status.COMPLETED, ServiceRequest.Status.CANCELLED]:
            raise ValidationError({"service_request": "Cannot quote a closed service request."})

    def save(self, *args, **kwargs):
        is_new = self._state.adding
        super().save(*args, **kwargs)
        if (
            is_new
            and self.status == self.Status.SENT
            and self.service_request.status == ServiceRequest.Status.PENDING
        ):
            self.service_request.status = ServiceRequest.Status.QUOTED
            self.service_request.save(update_fields=["status", "updated_at"])

    def accept(self):
        now = timezone.now()
        if self.status != self.Status.SENT:
            raise ValidationError("Only sent quotes can be accepted.")
        if self.expires_at and self.expires_at <= now:
            self.status = self.Status.EXPIRED
            self.save(update_fields=["status", "updated_at"])
            raise ValidationError("This quote has expired.")

        with transaction.atomic():
            Quote.objects.select_for_update().filter(
                service_request=self.service_request,
                status=self.Status.SENT,
            ).exclude(pk=self.pk).update(status=self.Status.REJECTED, updated_at=now)
            self.status = self.Status.ACCEPTED
            self.accepted_at = now
            self.save(update_fields=["status", "accepted_at", "updated_at"])
            request = self.service_request
            request.provider = self.provider
            request.accepted_quote = self
            request.status = ServiceRequest.Status.SCHEDULED
            request.anti_circumvention_acknowledged = True
            request.cancellation_policy_acknowledged = True
            request.save(
                update_fields=[
                    "provider",
                    "accepted_quote",
                    "status",
                    "anti_circumvention_acknowledged",
                    "cancellation_policy_acknowledged",
                    "updated_at",
                ]
            )
            PlatformPayment.objects.update_or_create(
                service_request=request,
                defaults={
                    "amount": self.amount + self.platform_fee,
                    "provider_amount": self.amount,
                    "platform_fee": self.platform_fee,
                    "currency": self.currency,
                    "status": PlatformPayment.Status.HELD,
                    "held_at": now,
                },
            )
            JobPin.objects.get_or_create_for_request(request)
        return self


class PlatformPayment(TimestampedModel):
    class Status(models.TextChoices):
        AWAITING_PAYMENT = "awaiting_payment", "Awaiting Payment"
        HELD = "held", "Held"
        RELEASE_PENDING = "release_pending", "Release Pending"
        RELEASED = "released", "Released"
        REFUNDED = "refunded", "Refunded"
        DISPUTED = "disputed", "Disputed"
        CANCELLED = "cancelled", "Cancelled"

    service_request = models.OneToOneField(ServiceRequest, on_delete=models.PROTECT, related_name="payment")
    amount = models.DecimalField(max_digits=12, decimal_places=2)
    provider_amount = models.DecimalField(max_digits=12, decimal_places=2)
    platform_fee = models.DecimalField(max_digits=12, decimal_places=2, default=0)
    currency = models.CharField(max_length=3, default="NGN")
    provider_transaction_reference = models.CharField(max_length=120, blank=True)
    status = models.CharField(max_length=30, choices=Status.choices, default=Status.AWAITING_PAYMENT)
    held_at = models.DateTimeField(null=True, blank=True)
    release_eligible_at = models.DateTimeField(null=True, blank=True)
    released_at = models.DateTimeField(null=True, blank=True)

    def clean(self):
        if self.status == self.Status.RELEASED:
            pin_verified = hasattr(self.service_request, "job_pin") and self.service_request.job_pin.verified_at
            if self.service_request.status != ServiceRequest.Status.COMPLETED or not pin_verified:
                raise ValidationError("Payment can only be released after completed jobs with a verified PIN.")

    def release(self):
        pin_verified = hasattr(self.service_request, "job_pin") and self.service_request.job_pin.verified_at
        if self.service_request.status != ServiceRequest.Status.COMPLETED or not pin_verified:
            raise ValidationError("Payment can only be released after completed jobs with a verified PIN.")
        self.status = self.Status.RELEASED
        self.released_at = timezone.now()
        self.full_clean()
        self.save(update_fields=["status", "released_at", "updated_at"])

    def __str__(self):
        return f"{self.service_request} - {self.status}"


class JobPinManager(models.Manager):
    def get_or_create_for_request(self, service_request):
        pin, created = self.get_or_create(service_request=service_request)
        if created:
            pin.set_pin(f"{secrets.randbelow(10000):04d}")
            pin.save()
        return pin


class JobPin(TimestampedModel):
    service_request = models.OneToOneField(ServiceRequest, on_delete=models.CASCADE, related_name="job_pin")
    pin_hash = models.CharField(max_length=128)
    generated_at = models.DateTimeField(default=timezone.now)
    verified_at = models.DateTimeField(null=True, blank=True)

    objects = JobPinManager()

    def set_pin(self, raw_pin):
        self.pin_hash = make_password(raw_pin)

    def check_pin(self, raw_pin):
        return check_password(raw_pin, self.pin_hash)

    def __str__(self):
        return f"PIN for {self.service_request_id}"


class ChatThread(TimestampedModel):
    service_request = models.OneToOneField(ServiceRequest, on_delete=models.CASCADE, related_name="chat_thread")
    is_locked = models.BooleanField(default=False)

    def __str__(self):
        return f"Chat for {self.service_request}"


class ChatMessage(TimestampedModel):
    class ModerationStatus(models.TextChoices):
        CLEAR = "clear", "Clear"
        FLAGGED = "flagged", "Flagged"
        HIDDEN = "hidden", "Hidden"

    thread = models.ForeignKey(ChatThread, on_delete=models.CASCADE, related_name="messages")
    sender = models.ForeignKey(User, on_delete=models.PROTECT, related_name="chat_messages")
    body = models.TextField()
    contact_detail_detected = models.BooleanField(default=False)
    detected_contact_details = models.JSONField(default=dict, blank=True)
    moderation_status = models.CharField(
        max_length=20,
        choices=ModerationStatus.choices,
        default=ModerationStatus.CLEAR,
    )

    class Meta:
        ordering = ["created_at"]

    def clean(self):
        request = self.thread.service_request
        allowed_sender_ids = {request.customer_id}
        if request.provider_id:
            allowed_sender_ids.add(request.provider.user_id)
        if self.sender_id not in allowed_sender_ids:
            raise ValidationError({"sender": "Only job participants can send chat messages."})

    def save(self, *args, **kwargs):
        detected = detect_contact_details(self.body)
        self.detected_contact_details = detected
        self.contact_detail_detected = bool(detected)
        if detected and self.moderation_status == self.ModerationStatus.CLEAR:
            self.moderation_status = self.ModerationStatus.FLAGGED
        super().save(*args, **kwargs)

    def __str__(self):
        return f"Message from {self.sender_id}"


class Rating(TimestampedModel):
    class RaterRole(models.TextChoices):
        CUSTOMER = "customer", "Customer"
        PROVIDER = "provider", "Provider"

    service_request = models.ForeignKey(ServiceRequest, on_delete=models.CASCADE, related_name="ratings")
    rater = models.ForeignKey(User, on_delete=models.PROTECT, related_name="ratings_given")
    ratee = models.ForeignKey(User, on_delete=models.PROTECT, related_name="ratings_received")
    rater_role = models.CharField(max_length=20, choices=RaterRole.choices)
    score = models.PositiveSmallIntegerField(validators=[MinValueValidator(1), MaxValueValidator(5)])
    comment = models.TextField(blank=True)

    class Meta:
        constraints = [
            models.UniqueConstraint(fields=["service_request", "rater"], name="unique_rating_per_rater_per_job")
        ]

    def clean(self):
        request = self.service_request
        if not request.is_rating_eligible:
            raise ValidationError("Ratings are only allowed after completed platform jobs.")
        if not request.provider_id:
            raise ValidationError("Cannot rate a job without a provider.")
        expected = {
            self.RaterRole.CUSTOMER: (request.customer_id, request.provider.user_id),
            self.RaterRole.PROVIDER: (request.provider.user_id, request.customer_id),
        }
        expected_rater, expected_ratee = expected[self.rater_role]
        if self.rater_id != expected_rater or self.ratee_id != expected_ratee:
            raise ValidationError("Ratings must be between the job customer and provider.")

    def __str__(self):
        return f"{self.score}/5 for request {self.service_request_id}"


class TrustedContactShare(TimestampedModel):
    service_request = models.ForeignKey(ServiceRequest, on_delete=models.CASCADE, related_name="trusted_contact_shares")
    shared_by = models.ForeignKey(User, on_delete=models.CASCADE, related_name="trusted_contact_shares")
    contact_name = models.CharField(max_length=120)
    contact_phone = models.CharField(max_length=32, blank=True)
    contact_email = models.EmailField(blank=True)
    share_token = models.CharField(max_length=64, unique=True, default=secrets.token_urlsafe)
    expires_at = models.DateTimeField(null=True, blank=True)
    revoked_at = models.DateTimeField(null=True, blank=True)

    def clean(self):
        if not self.contact_phone and not self.contact_email:
            raise ValidationError("A trusted contact needs a phone number or email address.")

    def __str__(self):
        return f"{self.contact_name} share for {self.service_request_id}"


class BlockRelationship(TimestampedModel):
    blocker = models.ForeignKey(User, on_delete=models.CASCADE, related_name="blocked_users")
    blocked = models.ForeignKey(User, on_delete=models.CASCADE, related_name="blocked_by")
    reason = models.TextField(blank=True)

    class Meta:
        constraints = [
            models.UniqueConstraint(fields=["blocker", "blocked"], name="unique_block_relationship"),
            models.CheckConstraint(check=~models.Q(blocker=models.F("blocked")), name="cannot_block_self"),
        ]

    def __str__(self):
        return f"{self.blocker_id} blocked {self.blocked_id}"


class IncidentReport(TimestampedModel):
    class Category(models.TextChoices):
        SAFETY = "safety", "Safety"
        PAYMENT = "payment", "Payment"
        HARASSMENT = "harassment", "Harassment"
        CIRCUMVENTION = "circumvention", "Circumvention"
        QUALITY = "quality", "Quality"
        OTHER = "other", "Other"

    class Status(models.TextChoices):
        OPEN = "open", "Open"
        REVIEWING = "reviewing", "Reviewing"
        RESOLVED = "resolved", "Resolved"
        DISMISSED = "dismissed", "Dismissed"

    reporter = models.ForeignKey(User, on_delete=models.PROTECT, related_name="incident_reports")
    reported_user = models.ForeignKey(
        User,
        on_delete=models.PROTECT,
        related_name="reports_against",
        null=True,
        blank=True,
    )
    service_request = models.ForeignKey(
        ServiceRequest,
        on_delete=models.SET_NULL,
        related_name="incident_reports",
        null=True,
        blank=True,
    )
    category = models.CharField(max_length=30, choices=Category.choices)
    description = models.TextField()
    status = models.CharField(max_length=20, choices=Status.choices, default=Status.OPEN)
    assigned_to = models.ForeignKey(
        User,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="assigned_incidents",
    )
    resolved_at = models.DateTimeField(null=True, blank=True)
    resolution_notes = models.TextField(blank=True)

    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return f"{self.category} report #{self.pk}"


class Dispute(TimestampedModel):
    class Status(models.TextChoices):
        OPEN = "open", "Open"
        UNDER_REVIEW = "under_review", "Under Review"
        RESOLVED_CUSTOMER = "resolved_customer", "Resolved for Customer"
        RESOLVED_PROVIDER = "resolved_provider", "Resolved for Provider"
        CANCELLED = "cancelled", "Cancelled"

    service_request = models.OneToOneField(ServiceRequest, on_delete=models.PROTECT, related_name="dispute")
    opened_by = models.ForeignKey(User, on_delete=models.PROTECT, related_name="opened_disputes")
    reason = models.TextField()
    status = models.CharField(max_length=30, choices=Status.choices, default=Status.OPEN)
    assigned_to = models.ForeignKey(
        User,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        related_name="assigned_disputes",
    )
    resolution_notes = models.TextField(blank=True)
    resolved_at = models.DateTimeField(null=True, blank=True)

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)
        request = self.service_request
        if request.status != ServiceRequest.Status.DISPUTED:
            request.status = ServiceRequest.Status.DISPUTED
            request.save(update_fields=["status", "updated_at"])
        if hasattr(request, "payment") and request.payment.status != PlatformPayment.Status.DISPUTED:
            request.payment.status = PlatformPayment.Status.DISPUTED
            request.payment.save(update_fields=["status", "updated_at"])

    def __str__(self):
        return f"Dispute for request {self.service_request_id}"


class AdminAuditLog(TimestampedModel):
    class Status(models.TextChoices):
        SUCCESS = "success", "Success"
        WARNING = "warning", "Warning"
        FAILURE = "failure", "Failure"

    actor = models.ForeignKey(User, on_delete=models.SET_NULL, null=True, blank=True, related_name="admin_audit_logs")
    action = models.CharField(max_length=80)
    target_type = models.CharField(max_length=80)
    target_id = models.CharField(max_length=80, blank=True)
    details = models.JSONField(default=dict, blank=True)
    status = models.CharField(max_length=20, choices=Status.choices, default=Status.SUCCESS)

    class Meta:
        ordering = ["-created_at"]

    def __str__(self):
        return f"{self.action} {self.target_type}"
