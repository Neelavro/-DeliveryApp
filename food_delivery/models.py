from django.db import models

# Create your models here.


class customuser(models.Model):
    user_name = models.CharField(max_length=50, null=False)
    password = models.CharField(max_length=50, null=False)
    email = models.EmailField(max_length=50, unique=True, default='default')
    type = models.CharField(max_length=50, null=True)
    
    def __str__(self):
        return self.user_name

class restaurant(models.Model):
    name = models.CharField(max_length=50, null=False)
    bin = models.CharField(max_length=50, primary_key=True)
    email = models.EmailField(max_length=50, null=True)
    phone = models.CharField(max_length=50, null=True)
    address = models.CharField(max_length=100, null=True)
    
    def __str__(self):
        return self.name

class menu(models.Model):
    item_name = models.CharField(max_length=50, null=False)
    bin_fk = models.ForeignKey(restaurant, on_delete=models.CASCADE)
    item_price = models.EmailField(max_length=50, null=True)
    item_description = models.CharField(max_length=100, null=True)
    
    def __str__(self):
        return self.item_name
    
class SessionToken(models.Model):
    user_email = models.EmailField(max_length=50)
    token = models.CharField(max_length=200)
    def __str__(self):
        return self.token
    
class Order(models.Model):
    user_email = models.ForeignKey(customuser, on_delete=models.CASCADE)
    order_value = models.PositiveBigIntegerField()
    status = models.CharField(max_length=50)
    order_desription = models.CharField(max_length=50)

    def __str__(self):
        return self.order_desription