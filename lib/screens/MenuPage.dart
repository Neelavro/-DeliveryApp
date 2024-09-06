import 'package:flutter/material.dart';
import 'package:delivery_app_admin_panel/Widget/MenuListWidget.dart';
import 'package:sizer/sizer.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title:  Text(
            "Restaurants"
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
                    const SizedBox(height: 10,),
                    MenuListWidget(),

                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, "/menucreate");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 10.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red
                    ),
                    child: Text(
                      "Create a Menu",
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
          ),
        ),
      ),
    );
  }
}
