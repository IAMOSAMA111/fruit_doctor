import 'package:flutter/material.dart';
import 'package:flutter_doctor/utilities/constants.dart';
import 'login.dart';
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
      initialRoute: Login.id,
      routes: Routes.ROUTE,

    );

  }
}


