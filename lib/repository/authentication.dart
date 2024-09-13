
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constant.dart';

Future<bool> loginUserApi(String phone, String password) async {
  final response = await http.post(
    Uri.parse('$serverurl/user/admin/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'phone': phone,
      'password': password,
    }),
  );
  if (response.statusCode == 200) {
    print(response.body);
    return true;
  } else {
    throw Exception('Failed to load user');
  }
}


Future<bool> createUserApi(String name,String phone,String email, String password) async {
  final response = await http.post(
    Uri.parse('$serverurl/user/admin/create'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
    }),
  );
  if (response.statusCode == 200) {
    print(response.body);
    return true;
  } else {
    throw Exception('Failed to load user');
  }
}