from django.contrib.auth.models import User
from .serializers import AdminProfileSerializer, UserSerializer
from .models import AdminProfile
from rest_framework import generics, permissions, viewsets


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = [permissions.IsAdminUser]


class AdminProfileViewSet(viewsets.ModelViewSet):
    queryset = AdminProfile.objects.all()
    serializer_class = AdminProfileSerializer
    permission_classes = [permissions.IsAuthenticated]
