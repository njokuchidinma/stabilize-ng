from django.contrib import admin

from .models import (
    AdminAuditLog,
    BlockRelationship,
    ChatMessage,
    ChatThread,
    Dispute,
    IdentityVerification,
    IncidentReport,
    JobPin,
    PlatformPayment,
    ProviderProfile,
    ProviderService,
    Quote,
    Rating,
    ServiceCategory,
    ServiceRequest,
    TrustedContactShare,
    UserProfile,
)


@admin.register(UserProfile)
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ["user", "role", "city", "account_status", "is_nysc_member", "is_new_mover"]
    list_filter = ["role", "account_status", "city", "is_nysc_member", "is_new_mover"]
    search_fields = ["user__username", "user__email", "user__first_name", "user__last_name", "phone_number"]


@admin.register(ServiceCategory)
class ServiceCategoryAdmin(admin.ModelAdmin):
    list_display = ["name", "parent", "status", "created_at"]
    list_filter = ["status", "parent"]
    search_fields = ["name", "description"]
    prepopulated_fields = {"slug": ["name"]}


class ProviderServiceInline(admin.TabularInline):
    model = ProviderService
    extra = 1


class IdentityVerificationInline(admin.TabularInline):
    model = IdentityVerification
    extra = 0
    fields = ["document_type", "document_reference", "status", "reviewed_by", "reviewed_at", "rejection_reason"]


@admin.register(ProviderProfile)
class ProviderProfileAdmin(admin.ModelAdmin):
    list_display = [
        "business_name",
        "user",
        "city",
        "verification_status",
        "average_rating",
        "completed_jobs_count",
        "approved_at",
    ]
    list_filter = ["verification_status", "city", "services"]
    search_fields = ["business_name", "user__username", "user__email", "city", "service_area"]
    inlines = [ProviderServiceInline, IdentityVerificationInline]


@admin.register(IdentityVerification)
class IdentityVerificationAdmin(admin.ModelAdmin):
    list_display = ["provider", "document_type", "status", "reviewed_by", "reviewed_at", "created_at"]
    list_filter = ["status", "document_type", "created_at"]
    search_fields = ["provider__business_name", "document_reference", "rejection_reason"]


class QuoteInline(admin.TabularInline):
    model = Quote
    extra = 0
    fields = ["provider", "amount", "platform_fee", "currency", "status", "expires_at", "accepted_at"]


@admin.register(ServiceRequest)
class ServiceRequestAdmin(admin.ModelAdmin):
    list_display = ["title", "customer", "provider", "category", "city", "status", "budget_amount", "created_at"]
    list_filter = ["status", "city", "category", "created_at"]
    search_fields = ["title", "description", "customer__username", "customer__email", "provider__business_name"]
    inlines = [QuoteInline]


@admin.register(Quote)
class QuoteAdmin(admin.ModelAdmin):
    list_display = ["service_request", "provider", "amount", "platform_fee", "currency", "status", "accepted_at"]
    list_filter = ["status", "currency", "created_at"]
    search_fields = ["service_request__title", "provider__business_name"]


@admin.register(PlatformPayment)
class PlatformPaymentAdmin(admin.ModelAdmin):
    list_display = ["service_request", "amount", "provider_amount", "platform_fee", "currency", "status", "held_at", "released_at"]
    list_filter = ["status", "currency", "created_at"]
    search_fields = ["service_request__title", "provider_transaction_reference"]


@admin.register(JobPin)
class JobPinAdmin(admin.ModelAdmin):
    list_display = ["service_request", "generated_at", "verified_at"]
    search_fields = ["service_request__title"]
    readonly_fields = ["pin_hash"]


class ChatMessageInline(admin.TabularInline):
    model = ChatMessage
    extra = 0
    fields = ["sender", "body", "contact_detail_detected", "moderation_status", "created_at"]
    readonly_fields = ["contact_detail_detected", "created_at"]


@admin.register(ChatThread)
class ChatThreadAdmin(admin.ModelAdmin):
    list_display = ["service_request", "is_locked", "created_at"]
    list_filter = ["is_locked"]
    search_fields = ["service_request__title"]
    inlines = [ChatMessageInline]


@admin.register(ChatMessage)
class ChatMessageAdmin(admin.ModelAdmin):
    list_display = ["thread", "sender", "contact_detail_detected", "moderation_status", "created_at"]
    list_filter = ["contact_detail_detected", "moderation_status", "created_at"]
    search_fields = ["body", "sender__username", "sender__email"]


@admin.register(Rating)
class RatingAdmin(admin.ModelAdmin):
    list_display = ["service_request", "rater", "ratee", "rater_role", "score", "created_at"]
    list_filter = ["rater_role", "score", "created_at"]
    search_fields = ["service_request__title", "rater__username", "ratee__username", "comment"]


@admin.register(TrustedContactShare)
class TrustedContactShareAdmin(admin.ModelAdmin):
    list_display = ["service_request", "shared_by", "contact_name", "contact_phone", "contact_email", "expires_at", "revoked_at"]
    list_filter = ["created_at", "expires_at", "revoked_at"]
    search_fields = ["contact_name", "contact_phone", "contact_email", "service_request__title"]


@admin.register(BlockRelationship)
class BlockRelationshipAdmin(admin.ModelAdmin):
    list_display = ["blocker", "blocked", "created_at"]
    search_fields = ["blocker__username", "blocked__username", "reason"]


@admin.register(IncidentReport)
class IncidentReportAdmin(admin.ModelAdmin):
    list_display = ["category", "reporter", "reported_user", "service_request", "status", "assigned_to", "created_at"]
    list_filter = ["category", "status", "created_at"]
    search_fields = ["description", "reporter__username", "reported_user__username", "service_request__title"]


@admin.register(Dispute)
class DisputeAdmin(admin.ModelAdmin):
    list_display = ["service_request", "opened_by", "status", "assigned_to", "created_at", "resolved_at"]
    list_filter = ["status", "created_at", "resolved_at"]
    search_fields = ["service_request__title", "opened_by__username", "reason", "resolution_notes"]


@admin.register(AdminAuditLog)
class AdminAuditLogAdmin(admin.ModelAdmin):
    list_display = ["action", "actor", "target_type", "target_id", "status", "created_at"]
    list_filter = ["action", "target_type", "status", "created_at"]
    search_fields = ["action", "target_type", "target_id", "actor__username"]
