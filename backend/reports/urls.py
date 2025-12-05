from django.urls import path,include
from rest_framework.routers import DefaultRouter
from .views import CategoryViewSet, ReportViewSet

router = DefaultRouter()
router.register(r'reports', ReportViewSet)
router.register(r'categories', CategoryViewSet)


urlpatterns = [
    path('', include(router.urls)),
]