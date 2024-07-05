from django.db import models


# Create your models here.
class Order(models.Model):
    user_email = models.EmailField(max_length=50)
    order_value = models.PositiveBigIntegerField(primary_key=True, auto_created=True)
    
