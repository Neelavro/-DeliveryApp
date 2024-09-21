
import 'dart:convert';

import 'package:delivery_app_admin_panel/constant.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> updateOrder(String id, String status ) async {
  final response = await http.put(
    Uri.parse('$serverurl/api/order/update'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'order_id': id,
      'order_status': status,
    }),
  );
  if (response.statusCode == 200) {
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load user');
  }
}