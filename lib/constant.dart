import 'package:flutter/cupertino.dart';

// String serverurl = "http://192.168.217.50:8000";
String serverurl = "http://192.168.0.192:8000";
List restaurantList = [];
List menuList = [];
Map restaurant = {};
List order = [];
List order_items = [];

double total_value = 0;
Map user = {};
List order_history = [];

Map cart_restaurant = {};

ValueNotifier<int> counter =ValueNotifier(0);

int cart_restauratn_id = 0;
