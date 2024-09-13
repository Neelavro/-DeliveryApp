import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key});

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  List name = ['Best Burger', "Beef Cheese Delight", "Maddox", "Set Menu 1", "MeatBox"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 16.w,
                    height: 8.h,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 10.w
                  ),
                  Text(
                    "Boom Boom Burger",
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
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(15),
                                height: 18.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(name[index],
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
                                            Text(
                                              "Tk 250",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10.sp
                                              ),

                                            ),
                                            Container(
                                              width: 50.w ,
                                              child: Text(
                                                "1pc- Chicken patty with cheese and mushroom, special house sauce",
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
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 5,),

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
      )
    );
  }
}
