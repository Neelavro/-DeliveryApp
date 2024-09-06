from django.urls import path
from . import views

urlpatterns = [
    path("user/login/", views.getUser, name= "user"),
    path("user/signup/", views.CreateUser, name= "user"),
    path("restaurant/create",views.CreateUser, name="restaurant"),
    path("user/admin/login",views.LoginAdmin, name="admin")

]