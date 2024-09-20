import 'package:delivery_app_admin_panel/screens/HomePage.dart';
import 'package:delivery_app_admin_panel/screens/LoginPage.dart';
import 'package:delivery_app_admin_panel/screens/MenuPage.dart';
import 'package:delivery_app_admin_panel/screens/OrderListPage.dart';
import 'package:delivery_app_admin_panel/screens/RestaurantCreatePage.dart';
import 'package:delivery_app_admin_panel/screens/SignUp.dart';
import 'package:delivery_app_admin_panel/screens/dummy.dart';
import 'package:delivery_app_admin_panel/screens/MenuCreate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


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
        case "/menupage":
          return MenuPage();
        case "/restaurantcreatepage":
          return RestaurantCreatePage();
        case "/menucreate":
          return MenuCreate();
        case "/orderlistpage":
          return OrderListPage();

      }
      return Dummy();
      // need to change to error page

    });
  }
}