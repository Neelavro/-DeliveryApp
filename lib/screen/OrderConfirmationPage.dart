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

class OrderConfirmationPage extends StatefulWidget {
  Map restaurant;
  OrderConfirmationPage(this.restaurant,{super.key});

  @override
  State<OrderConfirmationPage> createState() => _OrderConfirmationPageState();
}

class _OrderConfirmationPageState extends State<OrderConfirmationPage> {
  late SharedPreferences prefs;

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
      setState(() {
        loading = false;
      });
      return false;
    }
  }

  List<String> payment_methods = ["Cash", "Bkash", "Nagad"];
  List<String> delivery_types = ["Delivery", "Pickup"];
  String payment_method = '';
  String delivery_type = '';
  Widget Payment_Method() {
    return DropdownButton<String>(

      value: payment_method,
      elevation: 0,
      style: const TextStyle(color: Colors.black),

      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          payment_method = value!;
        });
      },
      items: payment_methods.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget Delivery_type() {
    return DropdownButton<String>(

      value: delivery_type,
      elevation: 0,
      style: const TextStyle(color: Colors.black),

      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          delivery_type = value!;
        });
      },
      items: delivery_types.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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
    payment_method = payment_methods.first;
    delivery_type = delivery_types.first;
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
          child: order.isEmpty ? Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Center(child: Text(
              "No items in cart.",
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
              ),
            ) ,),
          ): Column(
            children: [
              SizedBox(height: 1.h,),
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
                height: 1.h,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment Method :",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Payment_Method()
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Delivery Type :",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Delivery_type()
                ],
              ),
              SizedBox(height: 3.h,),
              Container(
                height: 40.8.h,
                width: 100.w,
                child: ListView.builder(
                    itemCount: order.length,
                    itemBuilder: (BuildContext context, int index) {

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
                                          counter.value -=1;
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

              SizedBox(height: 10,),
              OrderDetailsTextWidget("Total", total_value.toString()),
              SizedBox(height: 10,),
              OrderDetailsTextWidget("Delivery Charge", "${50.00}"),
              SizedBox(height: 10,),
              OrderDetailsTextWidget("Total Order Value", "${total_value+50.00}")

            ],
          ),
        ),
      ),
      floatingActionButton:order.isEmpty? Container(): Container(
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
            var contact = await prefs.getString("Contact")!;
            bool orderstatus = await createOrder(contact, widget.restaurant["pk"].toString(), "Pending", order_items, payment_method, delivery_type);
            if(orderstatus){
              order_items = [];
              order = [];
              total_value = 0;
              counter.value = 0;
              cart_restaurant = {};
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
