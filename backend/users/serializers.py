from django.contrib.auth.models import User
from rest_framework import serializers
from .models import AdminProfile


class UserSerializer(serializers.ModelSerializer):
    profile = serializers.PrimaryKeyRelatedField(
        many=False, queryset=AdminProfile.objects.all()
    )

    class Meta:
        model = User
        fields = ["id", "username", "profile"]


class AdminProfileSerializer(serializers.ModelSerializer):
    user = UserSerializer(read_only=True)

    class Meta:
        model = AdminProfile
        fields = "__all__"
