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
def LoginAdmin(request):

   if request.method == "POST":
        data = json.loads(request.body)
        users = CustomUser.objects.get(user_contact = data.get("phone"))
        if users.user_contact == data.get("phone") and users.user_password == data.get("password"):
            #new_token = sessionTokenHandler(users.email)
            return JsonResponse({ "data": "USER LOGIN SUCCESSFUL"}, safe=False)
@csrf_exempt
def CreateAdmin(request):
   if request.method == "POST":
        data = json.loads(request.body)
        users = CustomUser.objects.create(user_name = data.get("name"), user_password = data.get("password"), user_email = data.get("email"),  user_contact = data.get("phone"))
        return JsonResponse({ "data": "USER CREATE SUCCESSFUL"}, safe=False)


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
    #SessionToken.objects.create(user_email =  data.get("email"), token = token)
    users = CustomUser.objects.create(user_name = data.get("user_name"), user_password = data.get("user_password"), user_email = data.get("user_email"),  user_contact = data.get("user_contact"))
    return JsonResponse({ "message":"User created successfully"}, safe=False)

def sessionTokenHandler(email):
    session = SessionToken.objects.get(user_email= email)
    if session == None:
        print(True)
    decoded_token = jwt.decode(str(session.token), 'secret', algorithms=['HS256'])
    id = random.randint(0,10000000)
    payload = {
        "id":id,
        "email" : decoded_token['email'],
        "password" : decoded_token['password']
    }
    print(payload)
    session.delete()
    token = jwt.encode(payload, "secret", algorithm='HS256')
    print(token)
    SessionToken.objects.create(user_email = email, token = token )
    return token
    
@csrf_exempt
def createRestaurantPost(request):
    data = json.loads(request.body)
    print("DATA")
    print(data)
    restaurant = Restaurant.objects.create(restaurant_name = data.get("name"), restaurant_image = data.get("image_url") )
    return JsonResponse({ "message":"Restaurant created successfully"}, safe=False)

@csrf_exempt
def RestaurantGet(request):
    restaurant = Restaurant.objects.all()
    data = serializers.serialize('json',restaurant)
    return JsonResponse({"message": "Restaurant received SUCCESSFULLY", "data": data})

@csrf_exempt  
def IndividualRestaurantGet(request,id):
    restaurant = Restaurant.objects.get(restaurant_id=id)
    data = serializers.serialize('json',restaurant)
    return JsonResponse({"message": "Restaurant received SUCCESSFULLY", "data": data})
    
    