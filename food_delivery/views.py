from django.shortcuts import render
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

@csrf_exempt
def getUser(request):
    if request.method == "GET":
        users = customuser.objects.all()
        serializer = CustmUserSerializer(users, many = True)
        return JsonResponse({ "data":serializer.data}, safe=False)
    
    elif request.method == "POST":
        
        data = json.loads(request.body)
        print(data.get('emai'))
        users = customuser.objects.get(email = data.get("email"))
        print(users.email)
        if users.email == data.get("email") and users.password == data.get("password"):
            new_token = sessionTokenHandler(users.email)
            return JsonResponse({ "data": str(new_token)}, safe=False)
    


@csrf_exempt
def CreateUser(request):
    data = json.loads(request.body)
    
    #print(users)
    payload = {
                "email" : data.get("email"),
                "password" : data.get("password")
            }

    token = jwt.encode(payload, "secret", algorithm='HS256')
    SessionToken.objects.create(user_email =  data.get("email"), token = token)
    users = customuser.objects.create(user_name = data.get("user_name"), password = data.get("password"),email = data.get("email"),type = data.get("type"))
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
    
