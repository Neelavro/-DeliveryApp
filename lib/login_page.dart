import 'package:flutter/material.dart';
import 'package:test_app/button.dart';
import 'package:test_app/mytextfield.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController= TextEditingController();
  final passwordController= TextEditingController();
  //SIGNiN
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: SafeArea(
        child: Column(
          children:  [
            const SizedBox(height: 35),
            // logo
            const Icon(
              Icons.fastfood_outlined,
              size: 100,
            ),
            const SizedBox(height: 50),
            const Text(
              'Welcome Back!',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20,
              ),
            ),
            const SizedBox(height:25),
            //username
            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),

            const SizedBox(height:10),
            //pass
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 20),
            //forgot
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text ('Forgot PassWord?',
                  style: TextStyle (color: Colors.black87)
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            //sign in


            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                    'Not our member?',
                     style:TextStyle(color: Colors.grey)
                ),
                SizedBox(width: 10),
                Text(
                  'Register Now!',
                  style: TextStyle(
                    color: Colors.cyan, fontWeight: FontWeight.bold
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
