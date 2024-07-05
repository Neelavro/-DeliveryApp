import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  const MyButton({super.key, required this.onTap});

  @override
  Widget build (BuildContext context){
    return GestureDetector(
      child: Container(
        onTap: onTap,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 70),
          decoration:  BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(25),
          ),
          child:const Center(
              child: Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize:22,
                  ),
              ),
          ),
      ),
    );
  }
}