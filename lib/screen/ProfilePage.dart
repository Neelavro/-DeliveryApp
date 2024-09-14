import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Widget/ProfileWIdget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  late SharedPreferences prefs;
  bool loading =false;


  Future<bool> getCurrentUser() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });
    final response = await http.post(
        Uri.parse('$serverurl/user/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"phone": prefs.getString('Contact')})
    );
    if (response.statusCode == 200) {
      print(response.body);
      user = jsonDecode(response.body)["info"];
      print(user);
      setState(() {
        loading = false;
      });
      return true;
    } else {
      throw Exception('Failed to load user');
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 40,horizontal: 10),
              height: 30.h,
              width: 100.w,
              color: Colors.red,
              child: Text('Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
           ProfileInfoWidget("Name", user['user_name']),
           ProfileInfoWidget("Contact Number", user['user_contact']),
           ProfileInfoWidget("Email",user['user_email']),

          ],
        ),
      ),
    );
  }
}
