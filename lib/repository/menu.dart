

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constant.dart';

Future<bool> createMenu(String id, String name,String price, String descriptiom,String url ) async {
  final response = await http.post(
    Uri.parse('https://192.168.55.50/menu/create'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: json.encode(<String, String>{
      'id': id,
      'name': name,
      'price': price,
      'description': descriptiom,
      'image_url': url
    }),
  );
  if (response.statusCode == 200) {
    print(response.body);
    return true;
  } else {
    throw Exception('Failed to load menu');
  }
}
