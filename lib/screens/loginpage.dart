import "package:flutter/material.dart";

import 'MyHomePage.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  String email = "tashfia@gmail.com";
  String password = "12345";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width*0.7,
              child: TextField(
                controller: t1,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                 hintText: "Enter your email address:",
                ),

              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width*0.7,
              child: TextField(
                controller: t2,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  hintText: "Enter your password:",
                ),
                obscureText: true,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: (){
                if (t1.text==email && t2.text==password){
                  Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const MyHomePage(),
                    ),
                  );
                }

              },
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height*0.05,
                width: MediaQuery.of(context).size.width*0.5,
                color: Colors.amber,
                child: Text(
                  "Login"
                )
              ),
            ),
          ],
        ),
      ),
    );

  }
}
