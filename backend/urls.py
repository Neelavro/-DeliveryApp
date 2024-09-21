from django.urls import path
from . import views
from .api import authentication, restaurant, menu, storage_server, test, order

urlpatterns = [
    path("user/login/", views.getUser, name= "user"),
    path("user/signup/", views.CreateUser, name= "user"),
    path("user/", authentication.getCurrentUser, name= "user"),
    path("user/sessiontoken/", authentication.checkSessionToken, name= "user"),

    path("restaurant/create",restaurant.createRestaurantPost, name="restaurant"),
    path("restaurant",restaurant.RestaurantGet, name="restaurant"),
    path("restaurant/<int:id>",restaurant.IndividualRestaurantGet, name="restaurant"),
 
    path("user/admin/login",authentication.LoginAdmin, name="admin"),
    path("user/admin/create",authentication.CreateAdmin, name="admin"),

    path('upload/', storage_server.upload_image, name='upload_image'),

    path("menu/create",menu.createMenu, name="menu"),
    path("menu/<int:id>",menu.getMenu, name="menu"),
    path("menu/update",menu.updateMenu, name="menu"),
    path("test",test.handle_post_request, name="menu"),

    path("order/create",order.createOrder, name="order"),
    path("order/<str:id>",order.getOrder, name="order"),
    path("getorder",order.getALLOrder, name="order"),
    
    path("api/order/update",order.updateOrder, name="order")


]