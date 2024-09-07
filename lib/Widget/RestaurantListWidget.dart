import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:delivery_app_admin_panel/Widget/MenuListWidget.dart';
import 'package:delivery_app_admin_panel/constant.dart';
import 'package:delivery_app_admin_panel/screens/MenuPage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;



class RestaurantListWidget extends StatefulWidget {
  String title;
  List restaurantList;
  RestaurantListWidget(
      this.title,
      this.restaurantList,
      {Key? key}) : super();

  @override
  State<RestaurantListWidget> createState() => _RestaurantListWidgetState();
}

class _RestaurantListWidgetState extends State<RestaurantListWidget> {
  bool loading = false;


  List name = ['Takeout', "Chillox", "Madchef", "North End", "Butlers"];
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
      throw Exception('Failed to load restaurant');
    }
  }


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
                itemCount: restaurantList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: GestureDetector(onTap: ()async{
                      await getALLMenu(restaurantList[index]["pk"].toString());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MenuPage(restaurantList[index]['pk'].toString()),

                        ),
                      );
                    },
                      child: Container(
                        height: 20.h,
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
                              height: 10.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                                // image: DecorationImage(
                                //   image: NetworkImage(restaurantList[index]["fields"]["restaurant_image"])
                                // )
                              ),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: serverurl+restaurantList[index]["fields"]["restaurant_image"].toString(),
                                placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Colors.red,)),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              )
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              height: 10.h,
                              width: 20.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(restaurantList[index]["fields"]["restaurant_name"],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 2.sp
                                    ),
                                  ),
                                  const SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.currency_pound,size: 2.sp,color: Colors.grey,),
                                          Icon(Icons.currency_pound,size: 2.sp,color: Colors.grey),
                                        ],
                                      ),

                                      Text("Fast Food",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 2.sp
                                        ),
                                      ),
                                      Text("Price Match",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 2.sp
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    children: [
                                      Icon(Icons.access_time, color: Colors.black54,size: 2.sp),
                                      SizedBox(width: 10,),
                                      Text("5-30 min",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 2.sp
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
                    ),
                  );
                }
            ),
          ),
        ),
      ],
    );;
  }
}
