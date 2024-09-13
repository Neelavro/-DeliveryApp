import 'package:flutter/material.dart';
import 'package:food_delivery_app/repository/authentication.dart';
import 'package:sizer/sizer.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirm_password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/unnamed.png"),
              Container(
                width: 80.w,
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
                width: 80.w,
                child: TextFormField(
                  controller: email,
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    labelText: "email",
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
                width: 80.w,
                child: TextFormField(
                  controller: phone,
                  cursorColor: Colors.red,
                  keyboardType: TextInputType.phone,
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
                width: 80.w,
                child: TextFormField(
                  controller: password,
                  obscureText: true,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    labelText: "Password",
                    labelStyle: TextStyle(
                        color: Colors.black
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red,width: 2),

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: 80.w,
                child: TextFormField(
                  controller: confirm_password,
                  obscureText: true,
                  cursorColor: Colors.red,
                  decoration: InputDecoration(
                    focusColor: Colors.red,
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(
                        color: Colors.black
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.red,width: 2),

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              GestureDetector(
                onTap: ()async{
                  print("working");
                  bool signup = await createUserApi(name.text, phone.text, email.text, password.text);
                  if(signup){
                    Navigator.pushNamed(context, '/');
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 6.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.red
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 11.sp
                    ),
                  ),GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/');
                    },
                    child: Text(
                      " Sign in",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 11.sp
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
