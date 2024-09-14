import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/repository/order.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

class OrderConfirmationPage extends StatefulWidget {
  Map restaurant;
  OrderConfirmationPage(this.restaurant,{super.key});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
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
          child: order.length == 0? Center(child: Text(
            "No items in cart.",
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
            ),
          ) ,): Column(
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
                height: 40.8.h,
                width: 100.w,
                child: ListView.builder(
                    itemCount: order.length,
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
                                height: 7.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: (){
                                          print(order_items);
                                          total_value -= double.parse(menuList[index]['fields']['item_price']);
                                          order_items.remove(order[index]['pk']);
                                          order.remove(order[index]);
                                          print(order_items);
                                          setState(() {
                                          });
                                        },
                                      icon: Icon(Icons.dangerous, color: Colors.red,)),
                                    Text(order[index]['fields']['item_name'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      order[index]['fields']['item_price'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10.sp
                                      ),
                                    ),
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
              Divider(
                thickness: 2,
                height: 1,
                endIndent: 20,
                indent: 20,
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total :",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    total_value.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Charge :",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "50.0",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Order Value :",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${total_value+50.00}",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
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
        child: GestureDetector(
          onTap: ()async {
            var x = await prefs.getString("Contact")!;
            print(x);
            bool order = await createOrder(x, widget.restaurant["pk"].toString(), "pending", order_items);
            if(order){
              order_items = [];
              Navigator.pushNamed(context, "/homepage");
            }
          },
          child: Text("Place order",
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
