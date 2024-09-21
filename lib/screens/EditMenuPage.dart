import 'package:delivery_app_admin_panel/repostiory/menu.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../repostiory/restaurant.dart';

class MenuEdit extends StatefulWidget {
  String id;
  String name;
  String image;
  String price;
  String description;
  MenuEdit(this.id, this.name, this.image, this.price, this.description, {Key? key}) : super(key: key);

  @override
  State<MenuEdit> createState() => _MenuEditState();
}

class _MenuEditState extends State<MenuEdit> {
  TextEditingController name = TextEditingController();
  TextEditingController image = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController descriptiom = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name.text = widget.name;
    image.text = widget.image;
    price.text = widget.price;
    descriptiom.text = widget.description;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
            "Menu"
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
                  controller: name,
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    labelText: "Name",
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
                  readOnly: true,
                  controller: image,
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    labelText: "Image",
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
                  controller: price,
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    labelText: "Price",
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
                  controller: descriptiom,
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    labelText: "Description",
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
              const SizedBox(height: 40,),
              GestureDetector(
                onTap: ()async{
                  image.text  = await uploadImage();
                  setState(() {
                  });
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 6.h,
                    width: 18.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red
                    ),
                    child: Text(
                      "Upload a photo",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 6.sp
                      ),
                    )
                ),
              ),
              const SizedBox(height: 40,),
              GestureDetector(
                onTap: ()async{
                  await updateMenu(widget.id, name.text, price.text, descriptiom.text, image.text);
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
                    "Update",
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
