import 'package:delivery_app_admin_panel/repostiory/order.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderListWidget extends StatefulWidget {
  String title;
  List order;
  OrderListWidget(this.title, this.order, {Key? key}) : super();

  @override
  State<OrderListWidget> createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {
  List<String> name = ["Order ID: 01", "Order ID: 02", "Order ID: 03", "Order ID: 04", "Order ID: 05"];
  Map<String, dynamic> order_status_map = {};
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          widget.title,
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
                itemCount: widget.order.length,
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
                            "ORDER ID : ${widget.order[index]["order_id"]}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 4.sp,
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: ()async{
                                    order_status_map = await updateOrder(widget.order[index]["order_id"].toString(), "Cancelled");

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
                                    order_status_map = await updateOrder(widget.order[index]["order_id"].toString(), "Delivered");
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
    );
  }
}