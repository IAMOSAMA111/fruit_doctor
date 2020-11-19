import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_doctor/Screens/signup.dart';
import 'package:flutter_doctor/utilities/constants.dart';
import 'package:flutter_doctor/utilities/auth.dart' as auth;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_doctor/Screens/login.dart';
import 'package:animated_widgets/animated_widgets.dart';

class Welcome extends StatefulWidget {
  static const String id = 'Welcome';
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
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
                        width: 88,
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 50),
                            Text(
                              'WELCOME',
                              style: topHeadingStyle,
                            ),
                          ]),
                      SizedBox(
                        width: 80,
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
                      SizedBox(height: 150),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                              'assets/images/Components/man-with-plant.svg',
                              height: size.height * 0.3),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                      SizedBox(height: 20),
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
                                    builder: (context) => (Login())));
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
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
                                    builder: (context) => (Signup())));
                          },
                          child: Text(
                            'SIGNUP',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                      OrDivider(),
                      SizedBox(height: 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                {auth.a.loginWithFB(context)}, //loginWithFB()
                            child: SvgPicture.asset(
                                'assets/images/Components/with-fb.svg',
                                height: size.height * 0.07),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () => {
                              auth.a.loginWithGoogle(context)
                            }, //globals.logout()
                            child: SvgPicture.asset(
                                'assets/images/Components/with-google.svg',
                                height: size.height * 0.07),
                          ),
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

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.symmetric(vertical: size.height * 0.03),
        width: size.width * 0.8,
        child: Row(
          children: <Widget>[
            buildDivider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('OR Authenticate with', style: labelStyle1),
            ),
            buildDivider(),
          ],
        ));
  }
}

Expanded buildDivider() {
  return Expanded(
      child: Divider(
    color: primary_Color,
    height: 1.5,
  ));
}
