import 'package:flutter/material.dart';
import 'Screens/login.dart';
import 'Screens/signup.dart';
import 'Screens/bottomnav.dart';
class Routes {
 static Map<String, WidgetBuilder> _defaultRoute={

   Login.id: (context) => Login(),
   Signup.id: (context) => Signup(),
   BottomNavigation.id : (context) => BottomNavigation(),

 };
 static Map<String, WidgetBuilder> get ROUTE => _defaultRoute;
}
