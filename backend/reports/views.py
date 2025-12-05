from django.shortcuts import render
from rest_framework import viewsets
from .models import Category, Report
from .serializers import CategorySerializer, ReportSerializer

class CategoryViewSet(viewsets.ModelViewSet):
    queryset = Category.objects.all()
    serializer_class = CategorySerializer

class ReportViewSet(viewsets.ModelViewSet):
    queryset = Report.objects.all()
    serializer_class = ReportSerializer

