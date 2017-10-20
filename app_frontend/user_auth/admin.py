from django.contrib import admin

# Register your models here.

from .models import UserAuth

admin.site.register(UserAuth)
