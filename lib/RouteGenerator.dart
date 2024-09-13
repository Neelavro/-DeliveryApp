import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/HomePage.dart';
import 'package:food_delivery_app/screen/LoginPage.dart';
import 'package:food_delivery_app/screen/OrderDetails.dart';
import 'package:food_delivery_app/screen/SignUp.dart';
import 'package:food_delivery_app/screen/dummy.dart';
import 'package:food_delivery_app/screen/restaurantpage.dart';

class RouteGenerator {
  static Route<dynamic> allRoutes(RouteSettings settings) {

    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case "/":
          return LoginPage();
        case "/signup":
          return SignUpPage();
        case "/homepage":
          return HomePage();
        case "/restaurantpage":
          return RestaurantPage();
        case "/orderdetails":
          return OrderDetails();
      }
      return Dummy();
      // need to change to error page

    });
  }
}