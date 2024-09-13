import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DiscountListWidget extends StatefulWidget {
  const DiscountListWidget({Key? key}) : super(key: key);

  @override
  State<DiscountListWidget> createState() => _DiscountListWidgetState();
}

class _DiscountListWidgetState extends State<DiscountListWidget> {
  List name = ['Takeout', "Chillox", "Madchef", "North End", "Butlers"];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Discounts & Offers",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp
          ),
        ),
        Container(
          height: 25.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        height: 23.h,
                        width: 42.w,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(15)
                        ),
                      ),
                    ],
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
}
