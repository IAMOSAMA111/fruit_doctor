import 'package:flutter/material.dart';
import 'Screens/login.dart';
import 'Screens/signup.dart';
import 'Screens/bottomnav.dart';
import 'Screens/home.dart';
import 'Screens/weather.dart';
import 'Screens/welcome.dart';
import 'Screens/forgotPassword.dart';
import 'Screens/note_home.dart';
import 'Screens/todoist.dart';

class Routes {
  static Map<String, WidgetBuilder> _defaultRoute = {
    Welcome.id: (context) => Welcome(),
    Forgot_Password.id: (context) => Forgot_Password(),
    Login.id: (context) => Login(),
    Signup.id: (context) => Signup(),
    Home.id: (context) => Home(),
    Weather.id: (context) => Weather(),
    BottomNavigation.id: (context) => BottomNavigation(),
    NoteHome.id: (context) => NoteHome(),
    Todoist.id: (context) => Todoist(),
  };

  static Map<String, WidgetBuilder> get ROUTE => _defaultRoute;
}
