import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant.dart';
import 'package:food_delivery_app/screen/OrderDetailsPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  late SharedPreferences prefs;

  bool loading = false;
  Future<bool> getALLOrder() async {
   prefs = await SharedPreferences.getInstance();
   print(prefs.getString("Contact"));
   prefs.getString("Contact");
    setState(() {
      loading = true;
    });
    final response = await http.get(
      Uri.parse('$serverurl/order/${prefs.getString("Contact")}'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {

      order_history = jsonDecode(response.body)["data"];
      print(order_history);
      order_history = order_history.reversed.toList();
      print(order_history);

      setState(() {
        loading = false;
      });
      return true;
    } else {
      throw Exception('Failed to load restaurant');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getALLOrder();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red,elevation: 0,),
      body:loading? Center(child: CircularProgressIndicator(
        color: Colors.red,
      ),) : SingleChildScrollView(
        child: Column(
          children: [

            Container(
              padding: EdgeInsets.symmetric(vertical: 40,horizontal: 10),
              height: 30.h,
              width: 100.w,
              color: Colors.red,
              child: Text('Order History',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            order_history.isEmpty? Padding(
              padding:  EdgeInsets.only(top: 20.h),
              child: Center(child: Text("No orders to show.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp
                ),
              ),),
            ):
            Container(
              height: 70.8.h,
              width: 100.w,
              child: ListView.builder(
                  itemCount: order_history.length,
                  itemBuilder: (BuildContext context, int index) {
                    int counter = 0;
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OrderDetailsPage(order_history[index]['restaurant_id'].toString(),
                                  order_history[index]["order_items"],
                                  order_history[index]["payment_method"],
                                  order_history[index]["order_value"],
                                  order_history[index]["order_status"],
                                  order_history[index]["delivery_type"],
                                )

                          ),
                        );
                      },
                      child: Padding(
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
                                height: 8.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                                ),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.card_giftcard_rounded),
                                    SizedBox(width: 10.w,),
                                    Text("Order ID : ${order_history[index]['order_id']}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11.sp
                                      ),
                                    ),
                                    SizedBox(height: 5,),


                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
