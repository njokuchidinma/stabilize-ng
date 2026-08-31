from django.db.models import Avg, Count, Q, Sum
from django.core.exceptions import ValidationError as DjangoValidationError
from django.utils import timezone
from rest_framework import permissions, status, viewsets
from rest_framework.decorators import action, api_view, permission_classes
from rest_framework.response import Response

from .models import (
    AdminAuditLog,
    BlockRelationship,
    ChatMessage,
    ChatThread,
    Dispute,
    IdentityVerification,
    IncidentReport,
    PlatformPayment,
    ProviderProfile,
    Quote,
    Rating,
    ServiceCategory,
    ServiceRequest,
    TrustedContactShare,
    UserProfile,
)
from .serializers import (
    AdminAuditLogSerializer,
    BlockRelationshipSerializer,
    ChatMessageSerializer,
    ChatThreadSerializer,
    DisputeSerializer,
    IdentityVerificationSerializer,
    IncidentReportSerializer,
    PlatformPaymentSerializer,
    ProviderProfileSerializer,
    QuoteSerializer,
    RatingSerializer,
    ServiceCategorySerializer,
    ServiceRequestSerializer,
    TrustedContactShareSerializer,
    UserProfileSerializer,
)


def validation_error_response(exc):
    if hasattr(exc, "message_dict"):
        return Response(exc.message_dict, status=status.HTTP_400_BAD_REQUEST)
    return Response({"detail": exc.messages if hasattr(exc, "messages") else str(exc)}, status=status.HTTP_400_BAD_REQUEST)


class ScopedModelViewSet(viewsets.ModelViewSet):
    permission_classes = [permissions.IsAuthenticated]


class UserProfileViewSet(ScopedModelViewSet):
    serializer_class = UserProfileSerializer

    def get_queryset(self):
        if self.request.user.is_staff:
            return UserProfile.objects.select_related("user")
        return UserProfile.objects.select_related("user").filter(user=self.request.user)


class ServiceCategoryViewSet(ScopedModelViewSet):
    serializer_class = ServiceCategorySerializer

    def get_queryset(self):
        queryset = ServiceCategory.objects.select_related("parent")
        if self.request.user.is_staff:
            return queryset
        return queryset.filter(status=ServiceCategory.Status.ACTIVE)


class ProviderProfileViewSet(ScopedModelViewSet):
    serializer_class = ProviderProfileSerializer

    def get_queryset(self):
        queryset = ProviderProfile.objects.select_related("user", "approved_by").prefetch_related("services")
        if self.request.user.is_staff:
            return queryset
        return queryset.filter(Q(user=self.request.user) | Q(verification_status=ProviderProfile.VerificationStatus.VERIFIED))

    def perform_create(self, serializer):
        serializer.save(user=self.request.user)

    @action(detail=True, methods=["post"], permission_classes=[permissions.IsAdminUser])
    def approve(self, request, pk=None):
        provider = self.get_object()
        provider.verification_status = ProviderProfile.VerificationStatus.VERIFIED
        provider.approved_by = request.user
        provider.approved_at = timezone.now()
        provider.rejection_reason = ""
        provider.save(update_fields=["verification_status", "approved_by", "approved_at", "rejection_reason", "updated_at"])
        AdminAuditLog.objects.create(
            actor=request.user,
            action="approved_provider",
            target_type="ProviderProfile",
            target_id=str(provider.pk),
        )
        return Response(self.get_serializer(provider).data)

    @action(detail=True, methods=["post"], permission_classes=[permissions.IsAdminUser])
    def suspend(self, request, pk=None):
        provider = self.get_object()
        reason = request.data.get("reason", "")
        provider.verification_status = ProviderProfile.VerificationStatus.SUSPENDED
        provider.suspended_reason = reason
        provider.save(update_fields=["verification_status", "suspended_reason", "updated_at"])
        AdminAuditLog.objects.create(
            actor=request.user,
            action="suspended_provider",
            target_type="ProviderProfile",
            target_id=str(provider.pk),
            details={"reason": reason},
            status=AdminAuditLog.Status.WARNING,
        )
        return Response(self.get_serializer(provider).data)


class IdentityVerificationViewSet(ScopedModelViewSet):
    serializer_class = IdentityVerificationSerializer

    def get_queryset(self):
        queryset = IdentityVerification.objects.select_related("provider", "reviewed_by")
        if self.request.user.is_staff:
            return queryset
        return queryset.filter(provider__user=self.request.user)


class ServiceRequestViewSet(ScopedModelViewSet):
    serializer_class = ServiceRequestSerializer

    def get_queryset(self):
        queryset = ServiceRequest.objects.select_related(
            "customer",
            "provider",
            "provider__user",
            "category",
            "accepted_quote",
        )
        if self.request.user.is_staff:
            return queryset
        return queryset.filter(Q(customer=self.request.user) | Q(provider__user=self.request.user))

    @action(detail=True, methods=["post"])
    def start(self, request, pk=None):
        service_request = self.get_object()
        if not service_request.provider_id or service_request.provider.user_id != request.user.id:
            return Response({"detail": "Only the assigned provider can start this job."}, status=status.HTTP_403_FORBIDDEN)
        if service_request.status != ServiceRequest.Status.SCHEDULED:
            return Response({"detail": "Only scheduled jobs can be started."}, status=status.HTTP_400_BAD_REQUEST)
        service_request.status = ServiceRequest.Status.IN_PROGRESS
        service_request.save(update_fields=["status", "updated_at"])
        return Response(self.get_serializer(service_request).data)

    @action(detail=True, methods=["post"])
    def complete(self, request, pk=None):
        service_request = self.get_object()
        participant_ids = {service_request.customer_id}
        if service_request.provider_id:
            participant_ids.add(service_request.provider.user_id)
        if request.user.id not in participant_ids and not request.user.is_staff:
            return Response({"detail": "Only job participants can complete this job."}, status=status.HTTP_403_FORBIDDEN)
        raw_pin = request.data.get("pin")
        if not raw_pin:
            return Response({"detail": "Job PIN is required."}, status=status.HTTP_400_BAD_REQUEST)
        try:
            service_request.mark_completed_with_pin(raw_pin)
        except DjangoValidationError as exc:
            return validation_error_response(exc)
        return Response(self.get_serializer(service_request).data)

    @action(detail=True, methods=["post"])
    def cancel(self, request, pk=None):
        service_request = self.get_object()
        if service_request.customer_id != request.user.id and not request.user.is_staff:
            return Response({"detail": "Only the customer or admin can cancel this request."}, status=status.HTTP_403_FORBIDDEN)
        reason = request.data.get("reason", "")
        if not reason:
            return Response({"detail": "Cancellation reason is required."}, status=status.HTTP_400_BAD_REQUEST)
        if service_request.status in [ServiceRequest.Status.COMPLETED, ServiceRequest.Status.CANCELLED]:
            return Response({"detail": "This request is already closed."}, status=status.HTTP_400_BAD_REQUEST)
        service_request.status = ServiceRequest.Status.CANCELLED
        service_request.cancellation_reason = reason
        service_request.cancelled_at = timezone.now()
        service_request.full_clean()
        service_request.save(update_fields=["status", "cancellation_reason", "cancelled_at", "updated_at"])
        if hasattr(service_request, "payment") and service_request.payment.status == PlatformPayment.Status.HELD:
            service_request.payment.status = PlatformPayment.Status.CANCELLED
            service_request.payment.save(update_fields=["status", "updated_at"])
        return Response(self.get_serializer(service_request).data)


class QuoteViewSet(ScopedModelViewSet):
    serializer_class = QuoteSerializer

    def get_queryset(self):
        queryset = Quote.objects.select_related("service_request", "provider", "provider__user")
        if self.request.user.is_staff:
            return queryset
        return queryset.filter(Q(service_request__customer=self.request.user) | Q(provider__user=self.request.user))

    @action(detail=True, methods=["post"])
    def accept(self, request, pk=None):
        quote = self.get_object()
        if quote.service_request.customer_id != request.user.id and not request.user.is_staff:
            return Response({"detail": "Only the customer can accept a quote."}, status=status.HTTP_403_FORBIDDEN)
        try:
            quote.accept()
        except DjangoValidationError as exc:
            return validation_error_response(exc)
        return Response(self.get_serializer(quote).data)


class PlatformPaymentViewSet(ScopedModelViewSet):
    serializer_class = PlatformPaymentSerializer

    def get_queryset(self):
        queryset = PlatformPayment.objects.select_related("service_request", "service_request__customer")
        if self.request.user.is_staff:
            return queryset
        return queryset.filter(
            Q(service_request__customer=self.request.user)
            | Q(service_request__provider__user=self.request.user)
        )

    @action(detail=True, methods=["post"], permission_classes=[permissions.IsAdminUser])
    def release(self, request, pk=None):
        payment = self.get_object()
        try:
            payment.release()
        except DjangoValidationError as exc:
            return validation_error_response(exc)
        AdminAuditLog.objects.create(
            actor=request.user,
            action="released_payment",
            target_type="PlatformPayment",
            target_id=str(payment.pk),
        )
        return Response(self.get_serializer(payment).data)


class ChatThreadViewSet(ScopedModelViewSet):
    serializer_class = ChatThreadSerializer

    def get_queryset(self):
        queryset = ChatThread.objects.select_related("service_request", "service_request__provider")
        if self.request.user.is_staff:
            return queryset
        return queryset.filter(
            Q(service_request__customer=self.request.user)
            | Q(service_request__provider__user=self.request.user)
        )


class ChatMessageViewSet(ScopedModelViewSet):
    serializer_class = ChatMessageSerializer

    def get_queryset(self):
        queryset = ChatMessage.objects.select_related("thread", "thread__service_request", "sender")
        if self.request.user.is_staff:
            return queryset
        return queryset.filter(
            Q(thread__service_request__customer=self.request.user)
            | Q(thread__service_request__provider__user=self.request.user)
        )


class RatingViewSet(ScopedModelViewSet):
    serializer_class = RatingSerializer

    def get_queryset(self):
        queryset = Rating.objects.select_related("service_request", "rater", "ratee")
        if self.request.user.is_staff:
            return queryset
        return queryset.filter(Q(rater=self.request.user) | Q(ratee=self.request.user))


class TrustedContactShareViewSet(ScopedModelViewSet):
    serializer_class = TrustedContactShareSerializer

    def get_queryset(self):
        queryset = TrustedContactShare.objects.select_related("service_request", "shared_by")
        if self.request.user.is_staff:
            return queryset
        return queryset.filter(shared_by=self.request.user)


class BlockRelationshipViewSet(ScopedModelViewSet):
    serializer_class = BlockRelationshipSerializer

    def get_queryset(self):
        if self.request.user.is_staff:
            return BlockRelationship.objects.select_related("blocker", "blocked")
        return BlockRelationship.objects.select_related("blocker", "blocked").filter(blocker=self.request.user)


class IncidentReportViewSet(ScopedModelViewSet):
    serializer_class = IncidentReportSerializer

    def get_queryset(self):
        queryset = IncidentReport.objects.select_related("reporter", "reported_user", "service_request", "assigned_to")
        if self.request.user.is_staff:
            return queryset
        return queryset.filter(reporter=self.request.user)


class DisputeViewSet(ScopedModelViewSet):
    serializer_class = DisputeSerializer

    def get_queryset(self):
        queryset = Dispute.objects.select_related("service_request", "opened_by", "assigned_to")
        if self.request.user.is_staff:
            return queryset
        return queryset.filter(
            Q(opened_by=self.request.user)
            | Q(service_request__customer=self.request.user)
            | Q(service_request__provider__user=self.request.user)
        )


class AdminAuditLogViewSet(ScopedModelViewSet):
    serializer_class = AdminAuditLogSerializer
    permission_classes = [permissions.IsAdminUser]
    queryset = AdminAuditLog.objects.select_related("actor")


@api_view(["GET"])
@permission_classes([permissions.IsAdminUser])
def admin_dashboard_summary(request):
    active_statuses = [ServiceRequest.Status.SCHEDULED, ServiceRequest.Status.IN_PROGRESS]
    summary = {
        "total_users": UserProfile.objects.count(),
        "total_providers": ProviderProfile.objects.count(),
        "pending_enquiries": ServiceRequest.objects.filter(status=ServiceRequest.Status.PENDING).count(),
        "active_bookings": ServiceRequest.objects.filter(status__in=active_statuses).count(),
        "average_rating": Rating.objects.aggregate(score=Avg("score"))["score"] or 0,
        "pending_provider_reviews": ProviderProfile.objects.filter(
            verification_status=ProviderProfile.VerificationStatus.PENDING
        ).count(),
        "open_incidents": IncidentReport.objects.exclude(
            status__in=[IncidentReport.Status.RESOLVED, IncidentReport.Status.DISMISSED]
        ).count(),
        "flagged_chat_messages": ChatMessage.objects.filter(contact_detail_detected=True).count(),
        "held_payments_total": PlatformPayment.objects.filter(status=PlatformPayment.Status.HELD).aggregate(
            amount=Sum("amount")
        )["amount"]
        or 0,
        "top_services": list(
            ServiceRequest.objects.values("category__name")
            .annotate(total=Count("id"))
            .order_by("-total")[:5]
        ),
        "city_performance": list(
            ServiceRequest.objects.values("city")
            .annotate(
                bookings=Count("id"),
                revenue=Sum("payment__amount"),
                average_rating=Avg("ratings__score"),
            )
            .order_by("-bookings")[:10]
        ),
    }
    return Response(summary)
