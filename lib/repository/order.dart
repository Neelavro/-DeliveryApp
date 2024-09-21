
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constant.dart';

Future<bool> createOrder(String id, String res_id, String status, List items, String payment_method, String delivery_type) async {
  final response = await http.post(
    Uri.parse('$serverurl/order/create'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'user_id': id,
      'restaurant_id': res_id,
      'order_status': status,
      'order_items' : items.toString(),
      'payment_method': payment_method,
      'order_value': total_value.toString(),
      'delivery_type': delivery_type
    }),

  );
  print(jsonEncode(<String, String>{
    'user_id': id,
    'restaurant_id': res_id,
    'order_status': status,
    'order_items' : items.toString(),
    'payment_method': 'cash',
    'order_value': "1000",
    'delivery_type': delivery_type
  }));
  if (response.statusCode == 200) {
    print(response.body);
    return true;
  } else {
    throw Exception('Failed to load user');
  }
}