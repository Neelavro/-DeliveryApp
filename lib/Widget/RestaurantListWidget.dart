import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RestaurantListWigdet extends StatefulWidget {
  String title;
  RestaurantListWigdet(
      this.title,
      {Key? key}) : super();

  @override
  State<RestaurantListWigdet> createState() => _RestaurantListWigdetState();
}

class _RestaurantListWigdetState extends State<RestaurantListWigdet> {
  List name = ['Takeout', "Chillox", "Madchef", "North End", "Butlers"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp
          ),
        ),
        Container(
          height: 26.8.h,
          width: 100.w,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: Container(
                    decoration: BoxDecoration(
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
                        ), //BoxShadow
                        BoxShadow(
                          color: Colors.white,
                          offset: const Offset(0.0, 0.0),
                          blurRadius: 0.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 15.h,
                          width: 74.w,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          height: 10.h,
                          width: 74.w,
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
                                  Row(
                                    children: [
                                      Icon(Icons.currency_pound,size: 12.sp,color: Colors.grey,),
                                      Icon(Icons.currency_pound,size: 12.sp,color: Colors.grey),
                                    ],
                                  ),

                                  Text("Fast Food",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.sp
                                    ),
                                  ),
                                  Text("Price Match",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.sp
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5,),
                              Row(
                                children: [
                                  Icon(Icons.access_time, color: Colors.black54,size: 12.sp),
                                  SizedBox(width: 10,),
                                  Text("5-30 min",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 11.sp
                                    ),
                                  ),
                                ],
                              )
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
    );;
  }
}
