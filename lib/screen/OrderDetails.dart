import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Order Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 2.h),
            Row(
              children: [
                SizedBox(width: 3.w),
                Text(
                  "RECEIPT",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                SizedBox(width: 3.w),
                Container(
                  width: 95.w,
                  padding: EdgeInsets.all(10),
                  color: Colors.greenAccent,
                  child: Text(
                    "* Item price may vary depending on restaurant policy",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                SizedBox(width: 3.w),
                Container(
                  width: 95.w,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Meat Lovers Pizza (12 Inch)",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "৳1480.00",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                SizedBox(width: 3.w),
                Text(
                  "No Customization",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                SizedBox(width: 3.w),
                Container(
                  width: 95.w,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "1 x Meat Lovers Pizza",
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        "৳1480.00",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                SizedBox(width: 3.w),
                Text(
                  "Delivery Charge",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                SizedBox(width: 3.w),
                Container(
                  width: 95.w,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Base Fee",
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        "৳0.00",
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                SizedBox(width: 3.w),
                Container(
                  width: 95.w,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Long Distance Fee",
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        "৳14.00",
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                SizedBox(width: 3.w),
                Text(
                  "Promo & Discount",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              children: [
                SizedBox(width: 3.w),
                Container(
                  width: 95.w,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Restaurant Discount",
                        style: TextStyle(
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        "-৳1006.40",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),
            Container(
              height: 2,
              color: Colors.grey,
              width: 100.w,

            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                SizedBox(width: 3.w),
                Container(
                  width: 95.w,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Bill",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "৳487.60",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 2.h),

          ],
        ),
      ),
    );
  }
}


