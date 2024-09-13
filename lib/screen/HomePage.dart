import 'package:flutter/material.dart';
import 'package:food_delivery_app/Widget/DiscountListWidget.dart';
import 'package:food_delivery_app/Widget/RestaurantListWidget.dart';
import 'package:sizer/sizer.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:  Text(
          "BiteDash"
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              DiscountListWidget(),
              const SizedBox(height: 20,),
              RestaurantListWigdet("Order again"),
              const SizedBox(height: 20,),
              RestaurantListWigdet("Order again"),const SizedBox(height: 20,),
              RestaurantListWigdet("Order again"),const SizedBox(height: 20,),
              RestaurantListWigdet("Order again"),


            ],
          ),
        ),
      ),
    );
  }
}
