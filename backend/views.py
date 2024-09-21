from django.shortcuts import render
import random
import random
# Create your views here.
from rest_framework import generics
from .models import *
from .serializers import CustmUserSerializer
from django.http import JsonResponse
import json
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import authenticate
from rest_framework_simplejwt.tokens import RefreshToken
import jwt
from django.core import serializers
from django.core.files.storage import default_storage
from django.http import JsonResponse
from django.core.files.base import ContentFile



@csrf_exempt
def getUser(request):
    if request.method == "GET":
        users = CustomUser.objects.all()
        serializer = CustmUserSerializer(users, many = True)
        return JsonResponse({ "data":serializer.data}, safe=False)
    
    elif request.method == "POST":
        data = json.loads(request.body)
        print(data.get('emaiL'))
        users = CustomUser.objects.get(email = data.get("email"))
        print(users.email)
        if users.email == data.get("email") and users.password == data.get("password"):
            new_token = sessionTokenHandler(users.email)
            return JsonResponse({ "data": "USER LOGIN SUCCESSFUL"}, safe=False)



@csrf_exempt
def CreateUser(request):
    data = json.loads(request.body)
    
    print("DATA")
    print(data)
    payload = {
                "user_email" : data.get("user_email"),
                "user_password" : data.get("user_password")
            }
    
    token = jwt.encode(payload, "secret", algorithm='HS256')
    SessionToken.objects.create(user_email =  data.get("user_email"), token = token)
    users = CustomUser.objects.create(user_name = data.get("user_name"), user_password = data.get("user_password"), user_email = data.get("user_email"),  user_contact = data.get("user_contact"))
    return JsonResponse({ "message":"User created successfully"}, safe=False)







