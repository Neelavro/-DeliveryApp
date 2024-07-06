from django.contrib import admin
from .models import *
# Register your models here.

admin.site.register(customuser)
admin.site.register(restaurant)
admin.site.register(menu)
admin.site.register(SessionToken)
admin.site.register(Order)