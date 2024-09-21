from django.shortcuts import render
from ..models import Menu, Restaurant
from django.http import JsonResponse
import json
from django.views.decorators.csrf import csrf_exempt
from django.core import serializers


@csrf_exempt
def createMenu(request):
    data = json.loads(request.body)
    print("DATA")
    print(data)
    restaurant_id = data.get("id")
    restaurant = Restaurant.objects.get(pk=restaurant_id)

    Menu.objects.create(restaurant = restaurant, item_name = data.get("name"), item_price = data.get("price"), item_description = data.get("description"), image_url = data.get("image_url") )
    return JsonResponse({ "message":"Menu created successfully"}, safe=False)

@csrf_exempt
def getMenu(request,id):
    restaurant = Menu.objects.filter(restaurant_id = id)
    data = serializers.serialize('json',restaurant)
    return JsonResponse({"message": "Menu received SUCCESSFULLY", "data": json.loads(data)})

@csrf_exempt
def updateMenu(request):
    print("inside")
    if request.method == 'PUT':
        data = json.loads(request.body)
        menu_item = Menu.objects.get(id = data.get('id'))
        menu_item.item_name = data.get("name")
        menu_item.item_price = data.get("price")
        menu_item.item_description = data.get("description")
        menu_item.image_url = data.get("image_url")
        menu_item.save()
        return JsonResponse({"message": "Menu item updated successfully"}, safe=False)



