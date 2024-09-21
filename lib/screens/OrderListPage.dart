import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:delivery_app_admin_panel/Widget/OrderListWidget.dart';
import 'package:sizer/sizer.dart';

import '../constant.dart';
import '../repostiory/order.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({Key? key}) : super(key: key);
  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  bool loading = false;
  Map<String, dynamic> order_status_map = {};


  Future<bool> getALLOrder() async {
    setState(() {
      loading = true;
    });
    final response = await http.get(
      Uri.parse('$serverurl/getorder'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      order = jsonDecode(response.body)["data"];
      order =order.reversed.toList();
      setState(() {
        loading = false;
      });
      return true;
    } else {
      throw Exception('Failed to load restaurant');
    }
  }
  initfunc()async{
    getALLOrder();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initfunc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("ORDERS"),
      ),
      body:loading ? Center(child: CircularProgressIndicator(
        color: Colors.red,
      ),): SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            width: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Orders",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 5.sp
                  ),
                ),
                Container(
                  height: 90.8.h,
                  width: 20.w,
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                    child: ListView.builder(
                        itemCount: order.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              height: 20.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(
                                      3.0,
                                      4.0,
                                    ),
                                    blurRadius: 5.0,
                                    spreadRadius: 0.0,
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "ORDER ID : ${order[index]["order_id"]}",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 4.sp,
                                    ),
                                  ),
                                  order[index]["order_status"] == 'Delivered'?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.check_circle, color: Colors.green,),
                                      Expanded(
                                        child: InkWell(
                                          onTap: ()async{
                                            order_status_map = await updateOrder(order[index]["order_id"].toString(), "Delivered");
                                            initfunc();
                                            setState(() {

                                            });
                                          },
                                          child: Container(
                                            width: 17.w,
                                            height: 6.h,
                                            margin: EdgeInsets.only(left: 5), // Optional: Add margin to create space between buttons
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              "Delivered",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 3.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ):
                                  order[index]["order_status"] == 'Cancelled'?
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Icon(Icons.disabled_by_default_rounded, color: Colors.red,),
                                      Expanded(
                                        child: Container(
                                          height: 6.h,
                                          width: 17.w,
                                          margin: EdgeInsets.only(left: 5), // Optional: Add margin to create space between buttons
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.red,
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            "Cancelled",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 3.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ):
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: ()async{
                                            order_status_map = await updateOrder(order[index]["order_id"].toString(), "Cancelled");
                                            initfunc();
                                            },
                                          child: Container(
                                            height: 6.h,
                                            margin: EdgeInsets.only(right: 5), // Optional: Add margin to create space between buttons
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              "Cancelled",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 3.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: ()async{
                                            order_status_map = await updateOrder(order[index]["order_id"].toString(), "Delivered");
                                            initfunc();
                                            setState(() {

                                            });
                                          },
                                          child: Container(
                                            height: 6.h,
                                            margin: EdgeInsets.only(left: 5), // Optional: Add margin to create space between buttons
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.circular(5),
                                            ),
                                            child: Text(
                                              "Delivered",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 3.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ),
              ],
            )
              ],
            ),
          ),
        ),
      ),
    );
  }
}