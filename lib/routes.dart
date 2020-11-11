import 'package:flutter/material.dart';
import 'Screens/login.dart';
import 'Screens/signup.dart';
import 'Screens/bottomnav.dart';
import 'Screens/home.dart';
import 'Screens/weather.dart';
class Routes {
 static Map<String, WidgetBuilder> _defaultRoute={

   Login.id: (context) => Login(),
   Signup.id: (context) => Signup(),
   Home.id: (context) => Home(),
   Weather.id: (context) => Weather(),
   BottomNavigation.id : (context) => BottomNavigation(),

 };
 static Map<String, WidgetBuilder> get ROUTE => _defaultRoute;
}
