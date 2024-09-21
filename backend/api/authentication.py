import random
from ..models import *
from django.http import JsonResponse
import json
from django.views.decorators.csrf import csrf_exempt
import jwt


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
def checkSessionToken(request):
    if request.method =="POST":
        data = json.loads(request.body)
        stoken = data.get("token")
        token = SessionToken.objects.get(token = stoken)
        return JsonResponse({"message": "session valid"})
    
@csrf_exempt
def getCurrentUser(request):
    if request.method == "POST":
        
        data = json.loads(request.body)
        phone = data.get('phone')
        print(phone)
        user = CustomUser.objects.get(user_contact=phone)

        responseMap = {
            "user_name" : user.user_name,
            "user_email": user.user_email,
            "user_contact": user.user_contact
        }
        return JsonResponse({'message': "User received successfully.", "info": responseMap })    