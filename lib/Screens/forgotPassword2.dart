import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_doctor/Screens/forgotPassword3.dart';
import 'package:flutter_doctor/utilities/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_widgets/animated_widgets.dart';

class Forgot_Password2 extends StatefulWidget {
  static const String id = 'Forgot_Password2';

  @override
  _Forgot_Password2State createState() => _Forgot_Password2State();
}

class _Forgot_Password2State extends State<Forgot_Password2> {
  String code;

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
                SvgPicture.asset('assets/images/Components/upper-left.svg',
                    height: size.height * 0.1),
                SizedBox(
                  width: 55,
                ),
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  SizedBox(height: 50),
                  Text(
                    'FORGOT PASSWORD',
                    style: topHeadingStyle,
                  ),
                ]),
                SizedBox(
                  width: 50,
                ),
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                        'assets/images/Components/forgot-password.svg',
                        height: size.height * 0.27),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Don't Worry, You can easily reset it!",
                  style: labelStyle1,
                ),
                SizedBox(height: 40),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: loginBoxDecorationStyle,
                  height: 50.0,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlignVertical: TextAlignVertical.center,
                    onChanged: (value) {
                      this.code = value;
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
                      hintText: 'The code sent to your email',
                      hintStyle: placeholderStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
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
                              builder: (context) => (Forgot_Password3())));
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(height: 80),
                Row(
                  children: [
                    SvgPicture.asset('assets/images/Components/bottom-left.svg',
                        height: size.height * 0.15),
                  ],
                )
              ],
            )
          ])),
    ));
  }
}
