import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/screen/HomePage.dart';
import 'package:food_delivery_app/screen/LoginPage.dart';
import 'package:food_delivery_app/screen/OrderHistoryPage.dart';
import 'package:food_delivery_app/screen/ProfilePage.dart';
import 'package:food_delivery_app/screen/SearchPage.dart';
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
          return RestaurantPage({});
        case "/profilepage":
          return ProfilePage();
        case "/searchpage":
          return SearchPage();
        case "/orderhistory":
          return OrderHistoryPage();
      }
      return Dummy();
      // need to change to error page

    });
  }
}