import 'package:flutter/material.dart';
import 'package:flutter_doctor/Screens/login.dart';
import 'package:flutter_doctor/Screens/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottomnav.dart';


class LoginChecker extends StatefulWidget {
  static const String id="LoginChecker";
  @override
  _LoginCheckerState createState() => _LoginCheckerState();
}


class _LoginCheckerState extends State<LoginChecker> {

  void goToIntialScreen() async {
    SharedPreferences sharedpref = await SharedPreferences.getInstance();

    bool logedin = await sharedpref.getBool("loggedin");
    if(logedin==null || logedin==false ){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
              (Welcome())));
    }
    else{
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
              (BottomNavigation())));
    }
  }

  @override
  Widget build(BuildContext context) {
    goToIntialScreen();
    return Container();
  }
}
