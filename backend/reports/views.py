from rest_framework import viewsets
from .models import Category, Report
from .serializers import CategorySerializer, ReportSerializer


class CategoryViewSet(viewsets.ModelViewSet):
    authentication_classes = []
    permission_classes = []
    queryset = Category.objects.all()
    serializer_class = CategorySerializer


class ReportViewSet(viewsets.ModelViewSet):
    authentication_classes = []
    permission_classes = []
    queryset = Report.objects.all()
    serializer_class = ReportSerializer
