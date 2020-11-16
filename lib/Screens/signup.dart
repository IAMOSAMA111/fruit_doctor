import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_doctor/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_doctor/Screens/login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_widgets/animated_widgets.dart';

class Signup extends StatefulWidget {
  static const String id = 'Signup';
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String name;
  String email;
  String password;
  String confirmPassword;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                          'assets/images/Components/upper-left.svg',
                          height: size.height * 0.1),
                      SizedBox(
                        width: 95,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 50),
                            Text(
                              'SIGN UP',
                              style: topHeadingStyle,
                            ),
                          ]),
                      SizedBox(
                        width: 90,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 50),
                            RotationAnimatedWidget.tween(
                              duration: Duration(minutes: 3),
                              delay: Duration(milliseconds: 500),
                              enabled: true,
                              rotationDisabled: Rotation.deg(z: -3600),
                              rotationEnabled: Rotation.deg(z: 0),
                              child: SvgPicture.asset(
                                  'assets/images/Components/upper-right.svg',
                                  height: size.height * 0.04),
                            )
                          ]),
                      SizedBox(height: 120),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              'assets/images/Components/watering-the-plant.svg',
                              height: size.height * 0.23),
                        ],
                      ),
                      SizedBox(height: 25),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: loginBoxDecorationStyle,
                        height: 45.0,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          keyboardType: TextInputType.name,
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (value) {
                            this.name = value;
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'CM Sans Serif',
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.person,
                              color: placeholderColor,
                            ),
                            hintText: 'Enter your Full Name',
                            hintStyle: placeholderStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: loginBoxDecorationStyle,
                        height: 45.0,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (value) {
                            this.email = value;
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'CM Sans Serif',
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.alternate_email,
                              color: placeholderColor,
                            ),
                            hintText: 'Enter your Email',
                            hintStyle: placeholderStyle,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: loginBoxDecorationStyle,
                        height: 45.0,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: true,
                          onChanged: (value) {
                            this.password = value;
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'CM Sans Serif',
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: placeholderColor,
                            ),
                            hintText: 'Enter your Password',
                            hintStyle: placeholderStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: loginBoxDecorationStyle,
                        height: 45.0,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: true,
                          onChanged: (value) {
                            this.confirmPassword = value;
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'CM Sans Serif',
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: placeholderColor,
                            ),
                            hintText: 'Confirm Password',
                            hintStyle: placeholderStyle,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                  ButtonTheme(
                    buttonColor: secondary_Color,
                    minWidth: size.width * 0.8,
                    height: size.height * 0.05,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => (Login())));
                      },
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: labelStyle1,
                          ),
                          GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (Login())))
                            },
                            child: Text("Signin!",
                                style: TextStyle(
                                    color: primary_Color,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                              'assets/images/Components/bottom-left.svg',
                              height: size.height * 0.15),
                        ],
                      )
                    ],
                  )
                ]))));
  }
}
