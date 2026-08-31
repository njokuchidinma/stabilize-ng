from django.contrib.auth import get_user_model
from django.core.exceptions import ValidationError as DjangoValidationError
from django.db.models import Avg
from rest_framework import serializers

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
    ProviderService,
    Quote,
    Rating,
    ServiceCategory,
    ServiceRequest,
    TrustedContactShare,
    UserProfile,
)


User = get_user_model()


def run_model_validation(instance):
    try:
        instance.full_clean()
    except DjangoValidationError as exc:
        if hasattr(exc, "message_dict"):
            raise serializers.ValidationError(exc.message_dict)
        raise serializers.ValidationError(exc.messages)


class UserSummarySerializer(serializers.ModelSerializer):
    full_name = serializers.CharField(source="get_full_name", read_only=True)

    class Meta:
        model = User
        fields = ["id", "username", "email", "full_name"]


class UserProfileSerializer(serializers.ModelSerializer):
    user = UserSummarySerializer(read_only=True)

    class Meta:
        model = UserProfile
        fields = [
            "id",
            "user",
            "role",
            "phone_number",
            "city",
            "sub_location",
            "account_status",
            "is_nysc_member",
            "is_new_mover",
            "suspended_reason",
            "suspended_at",
            "created_at",
            "updated_at",
        ]


class ServiceCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = ServiceCategory
        fields = ["id", "name", "slug", "description", "parent", "status", "created_at", "updated_at"]


class ProviderServiceSerializer(serializers.ModelSerializer):
    category_detail = ServiceCategorySerializer(source="category", read_only=True)

    class Meta:
        model = ProviderService
        fields = ["id", "provider", "category", "category_detail", "starting_price", "is_active"]


class ProviderProfileSerializer(serializers.ModelSerializer):
    user = UserSummarySerializer(read_only=True)
    service_ids = serializers.PrimaryKeyRelatedField(
        source="services",
        queryset=ServiceCategory.objects.all(),
        many=True,
        write_only=True,
        required=False,
    )
    services = ServiceCategorySerializer(many=True, read_only=True)

    class Meta:
        model = ProviderProfile
        fields = [
            "id",
            "user",
            "business_name",
            "bio",
            "city",
            "service_area",
            "verification_status",
            "services",
            "service_ids",
            "average_rating",
            "completed_jobs_count",
            "approved_at",
            "approved_by",
            "rejection_reason",
            "suspended_reason",
            "created_at",
            "updated_at",
        ]
        read_only_fields = ["average_rating", "completed_jobs_count", "approved_at", "approved_by"]

    def create(self, validated_data):
        services = validated_data.pop("services", [])
        provider = ProviderProfile.objects.create(**validated_data)
        for category in services:
            ProviderService.objects.get_or_create(provider=provider, category=category)
        return provider

    def update(self, instance, validated_data):
        services = validated_data.pop("services", None)
        instance = super().update(instance, validated_data)
        if services is not None:
            instance.services.set(services)
        return instance


class IdentityVerificationSerializer(serializers.ModelSerializer):
    class Meta:
        model = IdentityVerification
        fields = [
            "id",
            "provider",
            "document_type",
            "document_reference",
            "status",
            "reviewed_by",
            "reviewed_at",
            "rejection_reason",
            "created_at",
            "updated_at",
        ]
        read_only_fields = ["reviewed_by", "reviewed_at"]


class ServiceRequestSerializer(serializers.ModelSerializer):
    customer = UserSummarySerializer(read_only=True)
    provider_detail = ProviderProfileSerializer(source="provider", read_only=True)
    category_detail = ServiceCategorySerializer(source="category", read_only=True)
    payment_status = serializers.CharField(source="payment.status", read_only=True)
    is_rating_eligible = serializers.BooleanField(read_only=True)

    class Meta:
        model = ServiceRequest
        fields = [
            "id",
            "customer",
            "provider",
            "provider_detail",
            "category",
            "category_detail",
            "title",
            "description",
            "city",
            "address",
            "preferred_start_at",
            "budget_amount",
            "accepted_quote",
            "status",
            "payment_status",
            "is_rating_eligible",
            "anti_circumvention_acknowledged",
            "cancellation_policy_acknowledged",
            "cancellation_reason",
            "completed_at",
            "cancelled_at",
            "created_at",
            "updated_at",
        ]
        read_only_fields = [
            "accepted_quote",
            "status",
            "completed_at",
            "cancelled_at",
            "anti_circumvention_acknowledged",
            "cancellation_policy_acknowledged",
        ]

    def create(self, validated_data):
        request = self.context.get("request")
        if request and request.user and request.user.is_authenticated:
            validated_data["customer"] = request.user
        service_request = ServiceRequest.objects.create(**validated_data)
        ChatThread.objects.get_or_create(service_request=service_request)
        return service_request


class QuoteSerializer(serializers.ModelSerializer):
    provider_detail = ProviderProfileSerializer(source="provider", read_only=True)

    class Meta:
        model = Quote
        fields = [
            "id",
            "service_request",
            "provider",
            "provider_detail",
            "amount",
            "platform_fee",
            "currency",
            "notes",
            "expires_at",
            "status",
            "accepted_at",
            "created_at",
            "updated_at",
        ]
        read_only_fields = ["status", "accepted_at"]

    def validate(self, attrs):
        instance = Quote(**attrs)
        run_model_validation(instance)
        return attrs


class PlatformPaymentSerializer(serializers.ModelSerializer):
    class Meta:
        model = PlatformPayment
        fields = [
            "id",
            "service_request",
            "amount",
            "provider_amount",
            "platform_fee",
            "currency",
            "provider_transaction_reference",
            "status",
            "held_at",
            "release_eligible_at",
            "released_at",
            "created_at",
            "updated_at",
        ]
        read_only_fields = ["held_at", "release_eligible_at", "released_at"]


class ChatMessageSerializer(serializers.ModelSerializer):
    sender = UserSummarySerializer(read_only=True)

    class Meta:
        model = ChatMessage
        fields = [
            "id",
            "thread",
            "sender",
            "body",
            "contact_detail_detected",
            "detected_contact_details",
            "moderation_status",
            "created_at",
            "updated_at",
        ]
        read_only_fields = ["contact_detail_detected", "detected_contact_details", "moderation_status"]

    def validate(self, attrs):
        request = self.context.get("request")
        instance = ChatMessage(sender=request.user, **attrs)
        run_model_validation(instance)
        return attrs

    def create(self, validated_data):
        request = self.context["request"]
        return ChatMessage.objects.create(sender=request.user, **validated_data)


class ChatThreadSerializer(serializers.ModelSerializer):
    messages = ChatMessageSerializer(many=True, read_only=True)

    class Meta:
        model = ChatThread
        fields = ["id", "service_request", "is_locked", "messages", "created_at", "updated_at"]


class RatingSerializer(serializers.ModelSerializer):
    rater = UserSummarySerializer(read_only=True)

    class Meta:
        model = Rating
        fields = [
            "id",
            "service_request",
            "rater",
            "ratee",
            "rater_role",
            "score",
            "comment",
            "created_at",
            "updated_at",
        ]

    def validate(self, attrs):
        request = self.context.get("request")
        instance = Rating(rater=request.user, **attrs)
        run_model_validation(instance)
        return attrs

    def create(self, validated_data):
        request = self.context["request"]
        rating = Rating.objects.create(rater=request.user, **validated_data)
        provider = rating.service_request.provider
        if provider:
            average = Rating.objects.filter(ratee=provider.user).aggregate(score=Avg("score"))["score"] or 0
            provider.average_rating = average
            provider.save(update_fields=["average_rating", "updated_at"])
        return rating


class TrustedContactShareSerializer(serializers.ModelSerializer):
    shared_by = UserSummarySerializer(read_only=True)

    class Meta:
        model = TrustedContactShare
        fields = [
            "id",
            "service_request",
            "shared_by",
            "contact_name",
            "contact_phone",
            "contact_email",
            "share_token",
            "expires_at",
            "revoked_at",
            "created_at",
            "updated_at",
        ]
        read_only_fields = ["share_token", "revoked_at"]

    def validate(self, attrs):
        request = self.context.get("request")
        instance = TrustedContactShare(shared_by=request.user, **attrs)
        run_model_validation(instance)
        return attrs

    def create(self, validated_data):
        request = self.context["request"]
        return TrustedContactShare.objects.create(shared_by=request.user, **validated_data)


class BlockRelationshipSerializer(serializers.ModelSerializer):
    blocker = UserSummarySerializer(read_only=True)

    class Meta:
        model = BlockRelationship
        fields = ["id", "blocker", "blocked", "reason", "created_at", "updated_at"]

    def validate(self, attrs):
        request = self.context["request"]
        if attrs["blocked"] == request.user:
            raise serializers.ValidationError({"blocked": "You cannot block yourself."})
        return attrs

    def create(self, validated_data):
        request = self.context["request"]
        return BlockRelationship.objects.create(blocker=request.user, **validated_data)


class IncidentReportSerializer(serializers.ModelSerializer):
    reporter = UserSummarySerializer(read_only=True)

    class Meta:
        model = IncidentReport
        fields = [
            "id",
            "reporter",
            "reported_user",
            "service_request",
            "category",
            "description",
            "status",
            "assigned_to",
            "resolved_at",
            "resolution_notes",
            "created_at",
            "updated_at",
        ]
        read_only_fields = ["status", "assigned_to", "resolved_at", "resolution_notes"]

    def create(self, validated_data):
        request = self.context["request"]
        return IncidentReport.objects.create(reporter=request.user, **validated_data)


class DisputeSerializer(serializers.ModelSerializer):
    opened_by = UserSummarySerializer(read_only=True)

    class Meta:
        model = Dispute
        fields = [
            "id",
            "service_request",
            "opened_by",
            "reason",
            "status",
            "assigned_to",
            "resolution_notes",
            "resolved_at",
            "created_at",
            "updated_at",
        ]
        read_only_fields = ["status", "assigned_to", "resolution_notes", "resolved_at"]

    def create(self, validated_data):
        request = self.context["request"]
        return Dispute.objects.create(opened_by=request.user, **validated_data)


class AdminAuditLogSerializer(serializers.ModelSerializer):
    actor = UserSummarySerializer(read_only=True)

    class Meta:
        model = AdminAuditLog
        fields = [
            "id",
            "actor",
            "action",
            "target_type",
            "target_id",
            "details",
            "status",
            "created_at",
            "updated_at",
        ]
