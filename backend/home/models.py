from django.db import models

# Create your models here.
class Books(models.Model):
    title = models.TextField(unique=True)
    content = models.TextField()