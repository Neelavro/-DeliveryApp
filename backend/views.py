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
def LoginAdmin(request):

   if request.method == "POST":
        data = json.loads(request.body)
        users = CustomUser.objects.get(user_contact = data.get("phone"))
        if users.user_contact == data.get("phone") and users.user_password == data.get("password"):
            print(users.user_email)
            new_token = sessionTokenHandler(users.user_email)
            return JsonResponse({ "data": "USER LOGIN SUCCESSFUL", "sessionToken": new_token}, safe=False)
        
@csrf_exempt
def CreateAdmin(request):
   if request.method == "POST":
        data = json.loads(request.body)
        payload = {
                "user_email" : data.get("email"),
                "user_password" : data.get("password")
            }
    
        token = jwt.encode(payload, "secret", algorithm='HS256')
        SessionToken.objects.create(user_email =  data.get("email"), token = token)
        users = CustomUser.objects.create(user_name = data.get("name"), user_password = data.get("password"), user_email = data.get("email"),  user_contact = data.get("phone"))
        return JsonResponse({ "data": "USER CREATE SUCCESSFUL", "sessionToken":token }, safe=False)


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
    SessionToken.objects.create(user_email =  data.get("email"), token = token)
    users = CustomUser.objects.create(user_name = data.get("user_name"), user_password = data.get("user_password"), user_email = data.get("user_email"),  user_contact = data.get("user_contact"))
    return JsonResponse({ "message":"User created successfully"}, safe=False)

def sessionTokenHandler(email):
    session = SessionToken.objects.get(user_email= email)
    if session == None:
        print(True)
    print('1')   
    decoded_token = jwt.decode(str(session.token), 'secret', algorithms=['HS256'])
    print(decoded_token)
    id = random.randint(0,10000000)
    payload = {
        "id":id,
        "user_email" : decoded_token['user_email'],
        "user_password" : decoded_token['user_password']
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
    return JsonResponse({"message": "Restaurant received SUCCESSFULLY", "data": json.loads(data)})

@csrf_exempt  
def IndividualRestaurantGet(request,id):
    restaurant = Restaurant.objects.get(restaurant_id=id)
    print("sadsa")
    restaurant = {
        "id" : restaurant.restaurant_id,
        "name" : restaurant.restaurant_name,
        "image_url" : restaurant.restaurant_image
    }
    print(restaurant)
    return JsonResponse({"message": "Restaurant received SUCCESSFULLY", "data": restaurant})



from django.core.files.storage import default_storage
from django.http import JsonResponse
@csrf_exempt
def upload_image(request):
    print("inside")
    if request.method == 'POST' and 'image' in request.FILES:
        image = request.FILES['image']
        # Generate a unique name for the file
        file_name = f"{uuid.uuid4()}_{image.name}"
        path = default_storage.save(f'uploads/{file_name}', ContentFile(image.read()))
        image_url = default_storage.url(path)
        print(image_url)
        return JsonResponse({"image_url": image_url}, status=200)

    return JsonResponse({"error": "No image uploaded"}, status=400)

@csrf_exempt
def createMenu(request):
    data = json.loads(request.body)
    print("DATA")
    print(data)
    restaurant_id = data.get("id")
    restaurant = Restaurant.objects.get(pk=restaurant_id)

    Menu.objects.create(restaurant = restaurant, item_name = data.get("name"), item_price = data.get("price"), item_description = data.get("description"), image_url = data.get("image_url") )
    return JsonResponse({ "message":"Restaurant created successfully"}, safe=False)

@csrf_exempt
def MenuGet(request,id):
    restaurant = Menu.objects.filter(restaurant_id = id)
    data = serializers.serialize('json',restaurant)
    return JsonResponse({"message": "Restaurant received SUCCESSFULLY", "data": json.loads(data)})

