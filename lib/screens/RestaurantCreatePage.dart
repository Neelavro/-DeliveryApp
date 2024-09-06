import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RestaurantCreatePage extends StatefulWidget {
  const RestaurantCreatePage({Key? key}) : super(key: key);

  @override
  State<RestaurantCreatePage> createState() => _RestaurantCreatePageState();
}

class _RestaurantCreatePageState extends State<RestaurantCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Restaurants"
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          width: 100.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40,),
              Container(
                width: 60.w,
                child: TextFormField(
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    labelText: "bin",
                    labelStyle: TextStyle(
                        color: Colors.black
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: 60.w,
                child: TextFormField(
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    labelText: "name",
                    labelStyle: TextStyle(
                        color: Colors.black
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: 60.w,
                child: TextFormField(
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    labelText: "Phone",
                    labelStyle: TextStyle(
                        color: Colors.black
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: 60.w,
                child: TextFormField(
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    labelText: "image",
                    labelStyle: TextStyle(
                        color: Colors.black
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, "/homepage");
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 10.h,
                  width: 20.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red
                  ),
                  child: Text(
                    "Create",
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
    );
  }
}
