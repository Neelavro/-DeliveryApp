from django.db import models
import uuid

class CustomUser(models.Model):
    user_contact = models.CharField(max_length=11, null=False,primary_key=True)
    user_name = models.CharField(max_length=50, null=False)
    user_password = models.CharField(max_length=50, null=False)
    user_email = models.EmailField(max_length=50, unique=True, default='default')
    

    def __str__(self):
        return self.user_name

class Restaurant(models.Model):
    restaurant_name = models.CharField(max_length=50, null=False)
    restaurant_image = models.CharField(max_length=300, null=False)
    restaurant_id = models.AutoField( editable=False, unique=True, primary_key=True)

    def __str__(self):
        return self.restaurant_name

class Menu(models.Model):  # Renamed from 'menu' to 'Menu' (Class names should be capitalized)
    restaurant = models.ForeignKey(Restaurant, related_name='menu_items', on_delete=models.CASCADE)
    image_url = models.CharField(max_length=300, null=False, default="")
    item_name = models.CharField(max_length=50, null=False)
    item_price = models.DecimalField(max_digits=10, decimal_places=2, null=True)
    item_description = models.CharField(max_length=100, null=True)

    def __str__(self):
        return self.item_name

class Order(models.Model):
    ORDER_STATUS_CHOICES = [('pending', 'Pending'), ('delivered', 'Delivered')]
    order_type = models.CharField(max_length=50, choices=ORDER_STATUS_CHOICES, default='pending')
    order_id = models.UUIDField(default=uuid.uuid4, editable=False, unique=True, primary_key=True)
    user = models.ForeignKey(CustomUser, related_name='user_orders', on_delete=models.CASCADE)
    restaurant = models.ForeignKey(Restaurant, related_name='restaurant_orders', on_delete=models.CASCADE)
    delivery = models.ForeignKey(CustomUser, related_name='delivery_orders', on_delete=models.CASCADE)
    order_items = models.ForeignKey(Menu, related_name='menu_orders', on_delete=models.CASCADE)
    delivery_address = models.CharField(max_length=500, null=False)
    order_value = models.DecimalField(max_digits=10, decimal_places=2, null=False)

    def __str__(self):
        return f"Order {self.order_id} - {self.order_type}"

class Reviews(models.Model):
    review = models.CharField(max_length=500, null=True)
    review_rating = models.DecimalField(max_digits=5, decimal_places=2, null=True)
    user = models.ForeignKey(CustomUser, related_name='user_reviews', on_delete=models.CASCADE)
    restaurant = models.ForeignKey(Restaurant, related_name='restaurant_reviews', on_delete=models.CASCADE)
    menu_item = models.ForeignKey(Menu, related_name='menu_reviews', on_delete=models.CASCADE)

class Payment(models.Model):
    payment_type_choices = [('cash', 'Cash'), ('bKash', 'BKash')]
    payment_type = models.CharField(max_length=50, choices=payment_type_choices, default='cash')
    order = models.ForeignKey(Order, related_name='order_payments', on_delete=models.CASCADE)
    user = models.ForeignKey(CustomUser, related_name='user_payments', on_delete=models.CASCADE)
    restaurant = models.ForeignKey(Restaurant, related_name='restaurant_payments', on_delete=models.CASCADE)

class Deliverer(models.Model):
    delivery_name = models.CharField(max_length=50, null=False)
    delivery_password = models.CharField(max_length=50, null=False)
    delivery_email = models.EmailField(max_length=50, unique=True, default='default')
    delivery_id = models.UUIDField(default=uuid.uuid4, editable=False, unique=True, primary_key=True)
    orders = models.ForeignKey(Order, related_name='order_deliverers', on_delete=models.CASCADE)
    user = models.ForeignKey(CustomUser, related_name='user_deliverers', on_delete=models.CASCADE)

    def __str__(self):
        return self.delivery_name

class SessionToken(models.Model):
    user_email = models.EmailField(max_length=50)
    token = models.CharField(max_length=200)

    def __str__(self):
        return self.token
    
class UploadedImage(models.Model):
    image = models.ImageField(upload_to='uploads/')
    uploaded_at = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return f"Image uploaded at {self.uploaded_at}"