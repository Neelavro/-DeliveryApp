import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/Widget/DiscountListWidget.dart';
import 'package:food_delivery_app/Widget/RestaurantListWidget.dart';
import 'package:food_delivery_app/screen/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';
import 'OrderConfirmationPage.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  late SharedPreferences prefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getALLRestaurant();

  }

  bool loading = false;
  Future<bool> getALLRestaurant() async {
    prefs = await SharedPreferences.getInstance();
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
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:  Text(
          "BiteDash"
        ),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      body: loading? Center(child: CircularProgressIndicator(
        color: Colors.red,
      ),): SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),

          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: 90.w,
                height: 6.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: const Offset(
                          3.0,
                          4.0,
                        ),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                      ),]
                ),
                child: TextFormField(
                  obscureText: true,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    hintText: "Search for your desired restaurant",
                    labelStyle: TextStyle(
                        color: Colors.black
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(15),

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white,width: 2),

                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, "/searchpage");
                  },
                ),
              ),
              const SizedBox(height: 20,),
              RestaurantListWigdet("Order again", restaurantList),
              const SizedBox(height: 20,),
              RestaurantListWigdet("Recommended for you", restaurantList),
              const SizedBox(height: 20,),
              RestaurantListWigdet("Try something new", restaurantList),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text('BiteDash',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title:  Text('Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Update the state of the app);
                // Then close the drawer
                Navigator.pushNamed(context, "/profilepage");
              },
            ),
            ListTile(
              title:  Text('Orders',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                // Update the state of the app

                // Then close the drawer
                Navigator.pushNamed(context, "/orderhistory");
              },
            ),
            SizedBox(height: 50.h,),
            ListTile(
              title:  Text('Log Out',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              onTap: () {
                user = {};
                order_items = [];
                order = [];
                prefs.setString("token", "value");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()

                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderConfirmationPage(cart_restaurant),

            ),
          );
        },
        child: Icon(Icons.shopping_cart_outlined, color: Colors.white,)
      ),
    );
  }
}
