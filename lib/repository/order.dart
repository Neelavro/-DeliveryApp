
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constant.dart';

Future<bool> createOrder(String id, String res_id, String status, List items) async {
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
    }),

  );
  print(jsonEncode(<String, String>{
    'user_id': id,
    'restaurant_id': res_id,
    'order_status': status,
    'order_items' : items.toString(),
  }));
  if (response.statusCode == 200) {
    print(response.body);
    return true;
  } else {
    throw Exception('Failed to load user');
  }
}