import 'dart:convert';

import 'package:delivery_app_admin_panel/constant.dart';
import 'package:delivery_app_admin_panel/repostiory/restaurant.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app_admin_panel/Widget/DiscountListWidget.dart';
import 'package:delivery_app_admin_panel/Widget/RestaurantListWidget.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initFunc();
  }
  bool loading = true;
  initFunc()async{
    getALLRestaurant();
    scaffoldKey.currentState?.setState(() {
      loading = false;
    });
  }

  Future<bool> getALLRestaurant() async {
    setState(() {
      loading = true;
    });
    final response = await http.get(
      Uri.parse('$serverurl/restaurant'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      restaurantList = jsonDecode(response.body)["data"];
      setState(() {
        loading = false;
      });
      return true;
    } else {
      throw Exception('Failed to load restaurant');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.red,
        title:  Text(
          "BiteDash"
        ),
      ),
      body: loading == true? Center(child: CircularProgressIndicator(
        color: Colors.red,
      ),): SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: 100.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 20,),
                    RestaurantListWidget("Restaurants", restaurantList),

                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, "/restaurantcreatepage");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 10.h,
                    width: 20.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red
                    ),
                    child: Text(
                      "Create a Restaurant",
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
