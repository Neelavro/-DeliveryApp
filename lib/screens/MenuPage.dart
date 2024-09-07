import 'dart:convert';

import 'package:delivery_app_admin_panel/screens/MenuCreate.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app_admin_panel/Widget/MenuListWidget.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

class MenuPage extends StatefulWidget {
  String id;
  MenuPage(this.id, {Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.id);
  }

  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:  Text(
            "Restaurants"
        ),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: 100.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                menuList != []?
                Column(
                  children: [
                    const SizedBox(height: 10,),
                    MenuListWidget(),
                  ],
                ): Center(child: Text("No menu found yet", style: TextStyle(
                  color: Colors.black,
                ),)),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MenuCreate(widget.id),

                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 10.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red
                    ),
                    child: Text(
                      "Create a Menu",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 6.sp
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
