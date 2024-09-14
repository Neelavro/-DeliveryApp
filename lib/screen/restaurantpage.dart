import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/repository/order.dart';
import 'package:food_delivery_app/screen/OrderConfirmationPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

class RestaurantPage extends StatefulWidget {
  Map restaurant;
  RestaurantPage(this.restaurant,{super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  late SharedPreferences prefs;
  ValueNotifier<int> counter = ValueNotifier(0);

  List name = ['Best Burger', "Beef Cheese Delight", "Maddox", "Set Menu 1", "MeatBox"];
  bool loading = false;
  Future<bool> getALLMenu(String id) async {
    print(id);
    setState(() {
      loading = true;
    });
    final response = await http.get(
      Uri.parse('$serverurl/menu/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      menuList = jsonDecode(response.body)["data"];
      print(jsonDecode(response.body));
      setState(() {
        loading = false;
      });
      return true;
    } else {
      throw Exception('Failed to load restaurant');
    }
  }
  Widget customModalSheet(Map menu){
    return  Container(
      padding: EdgeInsets.all(20),
      height: 200,

      decoration: BoxDecoration(
        color: Colors.white,

      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getALLMenu(widget.restaurant['pk'].toString());
    initfunc();

  }
  initfunc()async{
    prefs = await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body:loading? Center(child: CircularProgressIndicator(
        color: Colors.red,
      ),) :SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(height: 2.h,),
              Row(
                children: [
                  Container(
                    width: 20.w,
                    height: 9.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          serverurl+widget.restaurant["fields"]["restaurant_image"].toString(),
                        ),
                      ),
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

                  ),
                  SizedBox(
                    width: 10.w
                  ),
                  Text(
                    widget.restaurant['fields']['restaurant_name'],
                    style: TextStyle(
                      color: Colors. black,
                      fontSize: 15.sp,

                    ),
                  )
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Text(
                    "1.1km away | TK 50 delivery",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12.sp,
                    ),
                  )
                ],

              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "Delivery 20-35 mins",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 5.h,),
              Container(
                height: 60.8.h,
                width: 100.w,
                child: ListView.builder(
                    itemCount: menuList.length,
                    itemBuilder: (BuildContext context, int index) {
                      int counter = 0;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                            BoxShadow(
                            color: Colors.grey,
                            offset: const Offset(
                              3.0,
                              4.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                          ),] //Box
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                height: 20.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(menuList[index]['fields']['item_name'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Fast Food",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 11.sp
                                              ),
                                            ),
                                            SizedBox(height: 5,),
                                            Text(
                                              menuList[index]['fields']['item_price'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10.sp
                                              ),

                                            ),
                                            SizedBox(height: 5,),
                                            Container(
                                              width: 50.w ,
                                              child: Text(
                                                menuList[index]['fields']['item_description'],
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 10.sp
                                                ),

                                              ),
                                            )

                                          ],
                                        ),

                                        Container(
                                          height: 6.h,
                                          width: 12.w ,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.grey,
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  serverurl+menuList[index]["fields"]["image_url"].toString(),
                                                ),
                                              )
                                          ),

                                        )
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        GestureDetector(
                                            onTap: (){
                                             order_items.add(menuList[index]['pk']);
                                             order.add(menuList[index]);
                                             print(menuList[index]['fields']['item_price']);
                                             total_value += double.parse(menuList[index]['fields']['item_price']);
                                             print(total_value);
                                             print(order_items);
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              height: 4.h,
                                              width: 30.w,
                                              decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Text("Add to cart",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12.sp
                                                ),
                                              ),
                                            )),
                                        SizedBox(width: 5.w ,),

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderConfirmationPage(widget.restaurant),

            ),
          );
        },
        child: Container(
          alignment: Alignment.center,
          width: 92.w,
          height: 5.h,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(15),
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
          child: Text("Proceed to payment",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp
            ),
          ),
        ),
      ),
    );
  }
}
