import random
# Create your views here.
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
def getMenu(request):
    if request.method == "GET":
        menus = Menu.objects.all()
        return JsonResponse({"data":menus}, safe=False)
    
    elif request.method == "POST":
        data = json.loads(request.body)
        print(data.get('restaurant.id'))
        menus = Menu.objects.get(email = data.get("email"))
        print(users.email)
        if users.email == data.get("email") and users.password == data.get("password"):
            new_token = sessionTokenHandler(users.email)
            return JsonResponse({"data": "USER LOGIN SUCCESSFUL"}, safe=False)
        
@csrf_exempt
def CreateMenu(request):
    if request.method == "POST":
        data = json.loads(request.body)
        
        print("MENU")
        print(data)

        # token = jwt.encode("secret", algorithm='HS256')
        #SessionToken.objects.create(user_email =  data.get("email"), token = token)
        menus = Menu.objects.create(restaurant_id_id = data.get("restaurant"), item_name = data.get("item_name"), item_price = data.get("item_price"),  item_description = data.get("item_description"))
        return JsonResponse({ "message":"Menu created successfully"}, safe=False)

@csrf_exempt
def EditMenu(request):
    data = json.loads(request.body)
    
    print("MENU")
    print(data)
    
    # token = jwt.encode(payload, "secret", algorithm='HS256')
    #SessionToken.objects.create(user_email =  data.get("email"), token = token)
    users = Menu.objects.createdata.get(("restaurant"), item_name = data.get("item_name"), item_price = data.get("item_price"),  item_description = data.get("item_description"))
    return JsonResponse({ "message":"Menu edited successfully"}, safe=False)