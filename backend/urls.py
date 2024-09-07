from django.urls import path
from . import views

urlpatterns = [
    path("user/login/", views.getUser, name= "user"),
    path("user/signup/", views.CreateUser, name= "user"),
    path("restaurant/create",views.createRestaurantPost, name="restaurant"),
    path("restaurant",views.RestaurantGet, name="restaurant"),
    path("restaurant/<int:id>",views.IndividualRestaurantGet, name="restaurant"),
    path("user/admin/login",views.LoginAdmin, name="admin"),
    path("user/admin/create",views.CreateAdmin, name="admin"),
    path('upload/', views.upload_image, name='upload_image'),
    path("menu/create",views.createMenu, name="menu"),
    path("menu/<int:id>",views.MenuGet, name="menu"),
]