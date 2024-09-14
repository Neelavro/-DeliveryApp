import 'package:flutter/material.dart';
import 'package:food_delivery_app/constant.dart';
import 'package:sizer/sizer.dart';

import '../Widget/RestaurantListWidget.dart';
import '../Widget/SearchedRestuarant.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> searchResults = [];

  void onQueryChanged(String query) {
    setState(() {
      searchResults = restaurantList.where((item) => item["fields"]["restaurant_name"].toLowerCase().contains(query.toLowerCase()))
          .toList();

    });
    print(searchResults);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:  Text(
            "Search"
        ),

      ),

      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),

          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                width: 90.w,
                height: 6.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: const Offset(
                          3.0,
                          4.0,
                        ),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                      ),]
                ),
                child: TextFormField(
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    hintText: "Search for your desired restaurant",
                    labelStyle: TextStyle(
                        color: Colors.black
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(15),

                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white,width: 2),

                    ),
                  ),
                  onChanged: (String value){
                    onQueryChanged(value);
                  },
                ),
              ),
              const SizedBox(height: 20,),
              SearchedRestaurantListWigdet(searchResults)
            ],
          ),
        ),
      ),

    );
  }
}
