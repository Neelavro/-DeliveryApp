
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constant.dart';

Future<bool> loginUserApi(String phone, String password, SharedPreferences prefs) async {
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
    print(jsonDecode(response.body)["sessionToken"]);
    prefs.setString('token', jsonDecode(response.body)['sessionToken']);

    return true;
  } else {
    throw Exception('Failed to load user');
  }
}

Future<bool>checkSessionToken(SharedPreferences prefs)async{
  String token =prefs.getString('token')!;
  final response = await http.post(
    Uri.parse('$serverurl/user/sessiontoken/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'token': token,
    }),
  );
  if (response.statusCode == 200) {
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

