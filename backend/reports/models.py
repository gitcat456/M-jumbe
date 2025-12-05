from django.db import models

class Category(models.Model):
    name = models.CharField(max_length=100)
    
    def __str__(self):
        return self.name 
    
class Report(models.Model):
    
    STATUS_CHOICES = (  
        ('pending', 'Pending'),
        ('in_progress', 'In Progress'),  
        ('completed', 'Completed')
    )
    
    title = models.CharField(max_length=100)
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='reports')
    description = models.TextField()
    location = models.CharField(max_length=200) 
    photos = models.ImageField(upload_to='report_pics/')
    status = models.CharField(
        max_length=20,  
        choices=STATUS_CHOICES, 
        default='pending'
    )
    created_at = models.DateTimeField(auto_now_add=True)
    
    def __str__(self):
        return self.title 