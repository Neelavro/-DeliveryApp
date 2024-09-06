from django.urls import path
from . import views

urlpatterns = [
    path("user/login/", views.getUser, name= "user"),
    path("user/signup/", views.CreateUser, name= "user"),
    path("restaurant/create",views.createRestaurantPost, name="restaurant"),
    path("restaurant",views.RestaurantGet, name="restaurant"),
    path("restaurant/<int:id>",views.IndividualRestaurantGet, name="restaurant")
]