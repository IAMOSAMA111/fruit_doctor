import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_doctor/Screens/signup.dart';
import 'package:flutter_doctor/Screens/forgotPassword.dart';
import 'package:flutter_doctor/Screens/bottomnav.dart';
import 'package:flutter_doctor/utilities/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_widgets/animated_widgets.dart';

class Login extends StatefulWidget {
  static const String id = 'Login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;

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
                        width: 105,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 50),
                            Text(
                              'LOGIN',
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
                              'assets/images/Components/man-on-bicycle.svg',
                              height: size.height * 0.27),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: loginBoxDecorationStyle,
                        height: 50.0,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          textAlignVertical: TextAlignVertical.center,
                          onChanged: (value) {
                            this._email = value;
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
                        height: 50.0,
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          obscureText: true,
                          onChanged: (value) {
                            this._password = value;
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
                        height: 20,
                      ),
                      ButtonTheme(
                        buttonColor: primary_Color,
                        minWidth: size.width * 0.8,
                        height: size.height * 0.05,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        (BottomNavigation())));
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: labelStyle1,
                          ),
                          /* */
                          GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (Signup())))
                            },
                            child: Text("Signup!",
                                style: TextStyle(
                                    color: primary_Color,
                                    fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Forgot your ",
                            style: labelStyle2,
                          ),
                          GestureDetector(
                            onTap: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          (Forgot_Password())))
                            },
                            child: Text("Password?",
                                style: TextStyle(
                                    color: secondary_Color,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 13)),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
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
