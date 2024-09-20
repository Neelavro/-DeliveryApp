import 'package:flutter/material.dart';
import 'package:delivery_app_admin_panel/Widget/DiscountListWidget.dart';
import 'package:delivery_app_admin_panel/Widget/RestaurantListWidget.dart';
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
          child: Container(
            width: 100.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 20,),
                    RestaurantListWidget("Restaurants"),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/orderlistpage");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 10.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.red,
                        ),
                        child: Text(
                          "Order List",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 6.sp,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "/restaurantcreatepage");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 10.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.red
                        ),
                        child: Text(
                          "Create a Restaurant",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 6.sp
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

