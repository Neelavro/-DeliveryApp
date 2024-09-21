from django.shortcuts import render
from ..models import *
from django.http import JsonResponse
import json
from django.views.decorators.csrf import csrf_exempt
from django.core import serializers


@csrf_exempt
def createRestaurantPost(request):
    data = json.loads(request.body)
    print("DATA")
    print(data)
    Restaurant.objects.create(restaurant_name = data.get("name"), restaurant_image = data.get("image_url") )
    return JsonResponse({ "message":"Restaurant created successfully"}, safe=False)

@csrf_exempt
def RestaurantGet(request):
    restaurant = Restaurant.objects.all()
    data = serializers.serialize('json',restaurant)
    return JsonResponse({"message": "Restaurant received SUCCESSFULLY", "data": json.loads(data)})

@csrf_exempt  
def IndividualRestaurantGet(request,id):
    restaurant = Restaurant.objects.get(restaurant_id=id)
    restaurant = {
        "id" : restaurant.restaurant_id,
        "name" : restaurant.restaurant_name,
        "image_url" : restaurant.restaurant_image
    }
    print(restaurant)
    return JsonResponse({"message": "Restaurant received SUCCESSFULLY", "data": restaurant})

@csrf_exempt  
def updateRestaurant(request,id):
    restaurant = Restaurant.objects.get(restaurant_id=id)
    restaurant = {
        "id" : restaurant.restaurant_id,
        "name" : restaurant.restaurant_name,
        "image_url" : restaurant.restaurant_image
    }
    print(restaurant)
    return JsonResponse({"message": "Restaurant received SUCCESSFULLY", "data": restaurant})

@csrf_exempt
def updateRestaurant(request, id):
    print("inside")
    if request.method == 'PUT':
        data = json.loads(request.body)
        restaurant = Restaurant.objects.get(Restaurant_id = id)
        
        restaurant.restaurant_name = data.get("name")
        restaurant.restaurant_image = data.get("price")
    
        return JsonResponse({"message": "Restaurant item updated successfully"}, safe=False)
    
