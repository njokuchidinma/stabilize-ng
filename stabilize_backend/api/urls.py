from django.urls import include, path
from rest_framework.routers import DefaultRouter

from . import views


router = DefaultRouter()
router.register("user-profiles", views.UserProfileViewSet, basename="user-profile")
router.register("categories", views.ServiceCategoryViewSet, basename="category")
router.register("providers", views.ProviderProfileViewSet, basename="provider")
router.register("identity-verifications", views.IdentityVerificationViewSet, basename="identity-verification")
router.register("service-requests", views.ServiceRequestViewSet, basename="service-request")
router.register("quotes", views.QuoteViewSet, basename="quote")
router.register("payments", views.PlatformPaymentViewSet, basename="payment")
router.register("chat-threads", views.ChatThreadViewSet, basename="chat-thread")
router.register("chat-messages", views.ChatMessageViewSet, basename="chat-message")
router.register("ratings", views.RatingViewSet, basename="rating")
router.register("trusted-contact-shares", views.TrustedContactShareViewSet, basename="trusted-contact-share")
router.register("blocks", views.BlockRelationshipViewSet, basename="block")
router.register("incident-reports", views.IncidentReportViewSet, basename="incident-report")
router.register("disputes", views.DisputeViewSet, basename="dispute")
router.register("admin-audit-logs", views.AdminAuditLogViewSet, basename="admin-audit-log")

urlpatterns = [
    path("", include(router.urls)),
    path("admin-dashboard/summary/", views.admin_dashboard_summary, name="admin-dashboard-summary"),
]
