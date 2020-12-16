import 'package:flutter/material.dart';
import 'package:flutter_doctor/Screens/bottomnav.dart';
import 'package:flutter_doctor/Screens/login.dart';
import 'package:flutter_doctor/Screens/note_home.dart';
import 'package:flutter_doctor/Screens/signup.dart';
import 'package:flutter_doctor/Screens/todoist.dart';
import 'package:flutter_doctor/Screens/welcome.dart';
import 'package:flutter_doctor/Screens/home.dart';
import 'package:flutter_doctor/Screens/weather.dart';
import 'package:flutter_doctor/utilities/constants.dart';
import 'package:flutter_doctor/utilities/auth.dart' as auth;
import 'routes.dart';

void main() {
  runApp(FruitDoctor());
}

class FruitDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fruit Doctor',
      theme: fruitDoctorThemeData,
      initialRoute: auth.a.isLoggedIn ? BottomNavigation.id : Welcome.id,
      routes: Routes.ROUTE,
    );
  }
}
