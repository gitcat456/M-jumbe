from django.urls import path, include
from .views import AdminProfileViewSet, UserViewSet
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register(r"admin-profiles", AdminProfileViewSet, basename="adminprofile")
router.register(r"users", UserViewSet, basename="user")
urlpatterns = [
    path("", include(router.urls)),
]
