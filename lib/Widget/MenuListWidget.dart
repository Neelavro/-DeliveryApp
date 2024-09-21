import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../constant.dart';
import '../screens/EditMenuPage.dart';

class MenuListWidget extends StatefulWidget {
  MenuListWidget(
      {Key? key}) : super();

  @override
  State<MenuListWidget> createState() => _MenuListWidgetState();
}

class _MenuListWidgetState extends State<MenuListWidget> {
  List menu = ['Burger', "Pizza", "Chicken Fry", "Fries", "Meatbox"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Menu",
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
                itemCount: menuList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MenuEdit(
                                menuList[index]['pk'].toString(),
                                menuList[index]['fields']['item_name'],
                                menuList[index]['fields']['image_url'],
                                menuList[index]['fields']['item_price'],
                                menuList[index]['fields']['item_description'],
                            ),

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
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))

                              ),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: serverurl+menuList[index]["fields"]["image_url"].toString(),
                                placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Colors.red,)),
                                errorWidget: (context, url, error) => Icon(Icons.error),
                              ),
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
                                  Text(menuList[index]["fields"]['item_name'],
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
                                      Text(
                                        "${menuList[index]["fields"]['item_price']} BDT",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 2.sp
                                        ),
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
