from django.contrib import admin
from .models import *
# Register your models here.

admin.site.register(CustomUser)
admin.site.register(Restaurant)
admin.site.register(Menu)
admin.site.register(Order)
admin.site.register(Reviews)
admin.site.register(Deliverer)
admin.site.register(Payment)
admin.site.register(SessionToken)
