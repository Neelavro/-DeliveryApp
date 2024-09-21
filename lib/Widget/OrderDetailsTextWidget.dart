import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class OrderDetailsTextWidget extends StatefulWidget {
  String title;
  String price;
  OrderDetailsTextWidget(this.title, this.price, {Key? key}) : super(key: key);

  @override
  State<OrderDetailsTextWidget> createState() => _OrderDetailsTextWidgetState();
}

class _OrderDetailsTextWidgetState extends State<OrderDetailsTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${widget.title} :",
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.price,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
