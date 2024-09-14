import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant.dart';
import 'package:food_delivery_app/screen/restaurantpage.dart';
import 'package:sizer/sizer.dart';

class SearchedRestaurantListWigdet extends StatefulWidget {
  List restaurant_list;
  SearchedRestaurantListWigdet(

      this.restaurant_list,
      {Key? key}) : super();

  @override
  State<SearchedRestaurantListWigdet> createState() => _SearchedRestaurantListWigdetState();
}

class _SearchedRestaurantListWigdetState extends State<SearchedRestaurantListWigdet> {
  List name = ['Takeout', "Chillox", "Madchef", "North End", "Butlers"];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.8.h,
      width: 100.w,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.restaurant_list.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RestaurantPage(widget.restaurant_list[index]),
                  ),
                );
              },
              child: Padding(
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
                            borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)),

                          ),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: serverurl+widget.restaurant_list[index]["fields"]["restaurant_image"].toString(),
                            // imageUrl: "http://192.168.0.192:8000/media/uploads/92d3d1c9-497a-474e-943e-3d5f80734ce5_image_1726216689652.jpg",
                            placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Colors.red,)),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          )
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
                            Text(widget.restaurant_list[index]["fields"]["restaurant_name"],
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
              ),
            );
          }
      ),
    );;
  }
}
