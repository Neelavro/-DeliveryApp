

import 'dart:convert';

import 'package:http/http.dart' as http;

Future<bool> loginUserApi(String phone, String password) async {
  final response = await http.post(
    Uri.parse('http://192.168.0.192:8000/user/admin/login'),
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


Future<bool> createUserApi(String phone, String name, String email, String password) async {
  final response = await http.post(
    Uri.parse('http://192.168.0.192:8000/user/admin/create'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'phone': phone,
      'email': email,
      'name': name ,
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
