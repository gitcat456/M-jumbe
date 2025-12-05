from django.contrib import admin
from unfold.admin import ModelAdmin
from .models import AdminProfile


@admin.register(AdminProfile)
class AdminProfileAdmin(ModelAdmin):
    """
    Admin interface for AdminProfile model using Django Unfold.
    """
    list_display = (
        'user',
        'county',
    )
    list_filter = (
        'county',
    )
    search_fields = (
        'user__username',
        'user__email',
        'user__first_name',
        'user__last_name',
        'county',
    )
    raw_id_fields = ('user',)  # Use raw_id_fields for better performance with User model

    fieldsets = (
        ('User Information', {
            'fields': ('user',)
        }),
        ('Profile Information', {
            'fields': ('county',)
        }),
    )

    # Unfold-specific configurations
    list_per_page = 25
    show_full_result_count = True
