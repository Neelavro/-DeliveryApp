from django.shortcuts import render
from ..models import Menu, Restaurant, Order, CustomUser
from django.http import JsonResponse
import json
from django.views.decorators.csrf import csrf_exempt
from django.core import serializers
import ast


@csrf_exempt
def createOrder(request):
    data = json.loads(request.body)
    user_id = data.get("user_id")
    restaurant_id = data.get("restaurant_id")
    order_status = data.get("order_status")
    order_items = data.get("order_items")
    delivery_type1 = data.get("delivery_type")
    user = CustomUser.objects.get(pk=user_id)
    restaurant= Restaurant.objects.get(pk=restaurant_id)
    print(restaurant_id)
    Order.objects.create(user_id = user, restaurant_id = restaurant, order_items = order_items, order_type= order_status, order_value = data.get("order_value"), payment_method = data.get('payment_method') , delivery_type = delivery_type1)
    return JsonResponse({ "message": "Order created SUCCESSFULLY"}, safe=False)


@csrf_exempt
def getOrder(request,id):
    print(id)
    order = Order.objects.filter(user_id_id = id) #ekjon uer er kotogula order hoise phone number diye sheta filter kora
    #order = Order.objects.all()
    order_list = []
    
    for i in order:
        map = {}
        map['order_id'] = i.order_id
        map['restaurant_id'] =i.restaurant_id_id
        map['order_status'] =i.order_type
        map['order_value'] = i.order_value
        map['payment_method'] = i.payment_method
        map['delivery_type'] = i.delivery_type
        map['order_items'] = getOrderItems(i.order_items) 
        order_list.append(map)
    #print(order.order_items)
    map = {}
    
    
    
    return JsonResponse({"message": "Menu received SUCCESSFULLY", "data": order_list})


def getOrderItems(item_list):
    order_items = []
    item_list = item_list.replace(" ", "")
    item_list = ast.literal_eval(item_list)
    print("list",item_list)
    #print(item_list)
    for i in range(0,len(item_list)):
        map = {"item_name": '',"item_price":0 , "item_description": ""}
        menu = Menu.objects.get(pk=item_list[i]) # item list er value(menu_id) gula diye menu table e search kore ekekta menu fetch kora
        #print(type(item_list[i]), print(item_list[i]))
        #print("name")
        #print(menu.item_name)
        map['id'] = menu.id
        map['item_name'] = menu.item_name
        map['item_price'] = menu.item_price
        map['item_description'] = menu.item_description
        order_items.append(map) # dictionary te menu item details add kore sheta order_items list e append kore return kora 
    return order_items        


@csrf_exempt
def updateOrder(request):
    if request.method == "PUT":
        data = json.loads(request.body)
        id = data.get("order_id")
        print(id)
        order_status = data.get("order_status")
        order = Order.objects.get(order_id = id)
        order.order_type = order_status
        order.save()
        return JsonResponse({ "message": "Order updated SUCCESSFULLY", "data":data.get("order_status") }, safe=False)
    

@csrf_exempt
def getALLOrder(request):
    order = Order.objects.all() #ekjon uer er kotogula order hoise phone number diye sheta filter kora
    #order = Order.objects.all()
    order_list = []
    
    for i in order:
        map = {}
        map['order_id'] = i.order_id
        map['restaurant_id'] =i.restaurant_id_id
        map['order_status'] =i.order_type
        map['order_value'] = i.order_value
        map['payment_method'] = i.payment_method
        map['order_items'] = getOrderItems(i.order_items) 
        order_list.append(map)
    #print(order.order_items)
    map = {}
    
    
    
    return JsonResponse({"message": "Menu received SUCCESSFULLY", "data": order_list})    