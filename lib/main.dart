import 'package:flutter/material.dart';
import 'package:flutter_doctor/Screens/bottomnav.dart';
import 'package:flutter_doctor/Screens/login.dart';
import 'package:flutter_doctor/Screens/signup.dart';
import 'package:flutter_doctor/Screens/home.dart';
import 'package:flutter_doctor/Screens/weather.dart';
import 'package:flutter_doctor/utilities/constants.dart';
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
      theme: zFruitDoctorThemeData,
      initialRoute: Weather.id,
      routes: Routes.ROUTE,

    );

  }
}


