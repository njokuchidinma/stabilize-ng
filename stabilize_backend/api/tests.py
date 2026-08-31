from decimal import Decimal

from django.contrib.auth import get_user_model
from django.core.exceptions import ValidationError
from django.test import TestCase

from .models import (
    ChatMessage,
    ChatThread,
    PlatformPayment,
    ProviderProfile,
    Quote,
    Rating,
    ServiceCategory,
    ServiceRequest,
)


User = get_user_model()


class MarketplaceLifecycleTests(TestCase):
    def setUp(self):
        self.customer = User.objects.create_user(username="customer", email="customer@example.com", password="pass")
        self.provider_user = User.objects.create_user(username="provider", email="provider@example.com", password="pass")
        self.other_provider_user = User.objects.create_user(
            username="provider2",
            email="provider2@example.com",
            password="pass",
        )
        self.category = ServiceCategory.objects.create(
            name="Plumbing",
            slug="plumbing",
            status=ServiceCategory.Status.ACTIVE,
        )
        self.provider = ProviderProfile.objects.create(
            user=self.provider_user,
            business_name="Ahmed the Plumber",
            city="Lagos",
            verification_status=ProviderProfile.VerificationStatus.VERIFIED,
        )
        self.other_provider = ProviderProfile.objects.create(
            user=self.other_provider_user,
            business_name="Bola Electricals",
            city="Lagos",
            verification_status=ProviderProfile.VerificationStatus.VERIFIED,
        )
        self.service_request = ServiceRequest.objects.create(
            customer=self.customer,
            category=self.category,
            title="Kitchen pipe repair",
            description="Kitchen sink leak needs urgent repair",
            city="Lagos",
            budget_amount=Decimal("25000.00"),
        )
        self.thread = ChatThread.objects.create(service_request=self.service_request)

    def test_accepting_quote_creates_platform_payment_and_job_pin(self):
        quote = Quote.objects.create(
            service_request=self.service_request,
            provider=self.provider,
            amount=Decimal("20000.00"),
            platform_fee=Decimal("2000.00"),
        )
        competing_quote = Quote.objects.create(
            service_request=self.service_request,
            provider=self.other_provider,
            amount=Decimal("22000.00"),
        )

        quote.accept()

        self.service_request.refresh_from_db()
        quote.refresh_from_db()
        competing_quote.refresh_from_db()

        self.assertEqual(quote.status, Quote.Status.ACCEPTED)
        self.assertEqual(competing_quote.status, Quote.Status.REJECTED)
        self.assertEqual(self.service_request.status, ServiceRequest.Status.SCHEDULED)
        self.assertEqual(self.service_request.provider, self.provider)
        self.assertTrue(self.service_request.anti_circumvention_acknowledged)
        self.assertTrue(self.service_request.cancellation_policy_acknowledged)
        self.assertEqual(self.service_request.payment.status, PlatformPayment.Status.HELD)
        self.assertEqual(self.service_request.payment.amount, Decimal("22000.00"))
        self.assertTrue(self.service_request.job_pin.pin_hash)

    def test_payment_release_requires_completed_job_and_verified_pin(self):
        quote = Quote.objects.create(
            service_request=self.service_request,
            provider=self.provider,
            amount=Decimal("20000.00"),
        )
        quote.accept()
        self.service_request.refresh_from_db()

        with self.assertRaises(ValidationError):
            self.service_request.payment.release()

        self.service_request.job_pin.set_pin("1234")
        self.service_request.job_pin.save()
        self.service_request.mark_completed_with_pin("1234")
        self.service_request.payment.refresh_from_db()

        self.assertEqual(self.service_request.status, ServiceRequest.Status.COMPLETED)
        self.assertEqual(self.service_request.payment.status, PlatformPayment.Status.RELEASE_PENDING)

        self.service_request.payment.release()
        self.service_request.payment.refresh_from_db()

        self.assertEqual(self.service_request.payment.status, PlatformPayment.Status.RELEASED)
        self.assertIsNotNone(self.service_request.payment.released_at)

    def test_ratings_are_only_allowed_after_completed_platform_jobs(self):
        rating = Rating(
            service_request=self.service_request,
            rater=self.customer,
            ratee=self.provider_user,
            rater_role=Rating.RaterRole.CUSTOMER,
            score=5,
        )

        with self.assertRaises(ValidationError):
            rating.full_clean()

        quote = Quote.objects.create(
            service_request=self.service_request,
            provider=self.provider,
            amount=Decimal("20000.00"),
        )
        quote.accept()
        self.service_request.refresh_from_db()
        self.service_request.job_pin.set_pin("1234")
        self.service_request.job_pin.save()
        self.service_request.mark_completed_with_pin("1234")

        rating.full_clean()
        rating.save()

        self.assertEqual(Rating.objects.count(), 1)

    def test_chat_message_flags_contact_details_for_review(self):
        message = ChatMessage(
            thread=self.thread,
            sender=self.customer,
            body="Please call me on 08012345678 or email me@example.com",
        )

        message.full_clean()
        message.save()

        self.assertTrue(message.contact_detail_detected)
        self.assertEqual(message.moderation_status, ChatMessage.ModerationStatus.FLAGGED)
        self.assertIn("phone", message.detected_contact_details)
        self.assertIn("email", message.detected_contact_details)

    def test_non_participants_cannot_send_job_chat_messages(self):
        stranger = User.objects.create_user(username="stranger", password="pass")
        message = ChatMessage(thread=self.thread, sender=stranger, body="Hello")

        with self.assertRaises(ValidationError):
            message.full_clean()
