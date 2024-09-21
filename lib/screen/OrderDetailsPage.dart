import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Widget/OrderDetailsTextWidget.dart';
import 'package:food_delivery_app/repository/order.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

class OrderDetailsPage extends StatefulWidget {
  String restaurant_id;
  List items;
  String payment_method;
  String order_value;
  String order_status;
  String delivery_type;
  OrderDetailsPage(this.restaurant_id,this.items,this.payment_method, this.order_value, this.order_status, this.delivery_type, {super.key});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {

  late SharedPreferences prefs;
  ValueNotifier<int> counter = ValueNotifier(0);

  bool loading = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initfunc();
    print(widget.items);

  }
  initfunc()async{
    prefs = await SharedPreferences.getInstance();
    await getIndivdiualRestaurant(widget.restaurant_id);
  }

  Future<bool> getIndivdiualRestaurant(String id) async {
    print(id);
    setState(() {
      loading = true;
    });
    final response = await http.get(
      Uri.parse('$serverurl/restaurant/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      restaurant = jsonDecode(response.body)["data"];
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
      ),
      body:loading? Center(child: CircularProgressIndicator(
        color: Colors.red,
      ),) :SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: widget.items.length == 0? Center(child: Text(
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
                            serverurl+restaurant['image_url'].toString(),
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
                    restaurant['name'],
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
                height: 1.h,
              ),
              widget.order_status.toLowerCase() != 'pending'? Container():

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
              SizedBox(height: 1.h,),
              Row(
                children: [
                  widget.order_status == "Delivered"?
                  Icon(Icons.check_circle, color: Colors.green,):
                  widget.order_status == "Cancelled"?
                  Icon(Icons.disabled_by_default_rounded, color: Colors.red,):
                  Icon(Icons.delivery_dining_outlined),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "Order Sttus : ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    widget.order_status,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Row(
                children: [

                  Icon(Icons.car_repair),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "Delivery Type : ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    widget.delivery_type,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 3.h,),

              Container(
                height: 42.8.h,
                width: 100.w,
                child: ListView.builder(
                    itemCount: widget.items.length,
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
                                    Text(
                                      widget.items[index]['item_name'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 10.sp
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Text(
                                      widget.items[index]['item_price'],
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
              OrderDetailsTextWidget('Payment Method', widget.payment_method),
              SizedBox(height: 10,),
              OrderDetailsTextWidget('Total', widget.order_value),
              SizedBox(height: 10,),
              OrderDetailsTextWidget('Delivery Charge', "50"),
              SizedBox(height: 10,),
              OrderDetailsTextWidget('Total Order Value', (double.parse(widget.order_value)+50.00).toString()),
            ],
          ),
        ),
      ),

    );
  }
}
