import 'package:flutter/material.dart';
import 'package:delivery_app_admin_panel/Widget/OrderListWidget.dart';
import 'package:sizer/sizer.dart';

class OrderListPage extends StatefulWidget {
  const OrderListPage({Key? key}) : super(key: key);
  @override
  State<OrderListPage> createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("ORDERS"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            width: 100.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20,),
                OrderListWidget("ORDERS"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

