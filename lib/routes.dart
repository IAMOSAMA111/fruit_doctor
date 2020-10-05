import 'package:flutter/material.dart';
import 'login.dart';
class Routes {
 static Map<String, WidgetBuilder> _defaultRoute={

   Login.id: (context) => Login(),

 };
 static Map<String, WidgetBuilder> get ROUTE => _defaultRoute;
}
