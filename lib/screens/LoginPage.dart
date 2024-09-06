import 'package:delivery_app_admin_panel/repostiory/authentication.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/unnamed.png",height: 50.h,),
              Container(
                width: 50.w,
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
                width: 50.w,
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
              const SizedBox(height: 50,),
              GestureDetector(
                onTap: ()async{
                  print(phone.text);
                  bool x = await loginUserApi(phone.text, password.text);
                  if (x){
                    Navigator.pushNamed(context, "/homepage");
                  }
                  else{
                  }
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
                    "Sign in",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 6.sp
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 5.sp
                    ),
                  )
                  ,GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      " Sign up",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 5.sp
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
