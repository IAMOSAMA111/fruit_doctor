import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_doctor/Screens/signup.dart';
import 'package:flutter_doctor/Screens/welcome.dart';
import 'package:flutter_doctor/Screens/forgotPassword.dart';
import 'package:flutter_doctor/Screens/bottomnav.dart';
import 'package:flutter_doctor/utilities/constants.dart';
import 'package:flutter_doctor/utilities/auth.dart' as auth;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class Login extends StatefulWidget {
  static const String id = 'Login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password = '';
  var token;

  final _formEmail = GlobalKey<FormState>();
  final _formPassword = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                        width: 102,
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
                        child: Form(
                            key: _formEmail,
                            autovalidate: true,
                            child: TextFormField(
                              validator: Validators.compose([
                                Validators.required('Email is required'),
                                Validators.email('Invalid email address'),
                              ]),
                              keyboardType: TextInputType.emailAddress,
                              textAlignVertical: TextAlignVertical.center,
                              textAlign: TextAlign.left,
                              onChanged: (value) {
                                this._email = value;
                              },
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'CM Sans Serif',
                              ),
                              decoration: InputDecoration(
                                errorMaxLines: 1,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                errorStyle: TextStyle(
                                  backgroundColor: Colors.red,
                                  color: Colors.white,
                                  height: 0,
                                ),
                                helperText: '  ',
                                helperStyle: TextStyle(fontSize: 0, height: 0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.alternate_email,
                                  color: placeholderColor,
                                ),
                                hintText: 'Email Address',
                                hintStyle: placeholderStyle,
                              ),
                            )),
                      ),
                      SizedBox(height: 12),
                      Container(
                          alignment: Alignment.centerLeft,
                          decoration: loginBoxDecorationStyle,
                          height: 50.0,
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Form(
                            key: _formPassword,
                            autovalidate: true,
                            child: TextFormField(
                              validator:
                                  Validators.required('Password is required'),
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
                                errorMaxLines: 1,
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                errorStyle: TextStyle(
                                  backgroundColor: Colors.red,
                                  color: Colors.white,
                                  height: 0,
                                ),
                                helperText: '  ',
                                helperStyle: TextStyle(fontSize: 0, height: 0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: placeholderColor,
                                ),
                                hintText: 'Password',
                                hintStyle: placeholderStyle,
                              ),
                            ),
                          )),
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
                            if (_formEmail.currentState.validate() &&
                                _formPassword.currentState.validate()) {
                              auth.a
                                  .loginWithLocalAccount(_email, _password)
                                  .then((val) async {
                                if (val.data['success']) {
                                  auth.a.isLoggedIn = true;
                                  token = val.data['token'];
                                  auth.a.getinfo(token).then((info) {
                                    auth.a.userProfile[auth.E.username.index] =
                                        info.data['name'];
                                    auth.a.userProfile[auth.E.email.index] =
                                        info.data['email'];
                                    auth.a.userProfile[auth.E.photoURL.index] =
                                        null;
                                  });
                                  Fluttertoast.showToast(
                                      msg: 'Authenticated',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  //Popping all the previous pages because we dont want to take the user back to login page if presses the back button
                                  SharedPreferences sharepref = await SharedPreferences.getInstance();
                                  sharepref.setBool("loggedin", true);
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                  Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => (Welcome())));
                                  //taking to home
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              (BottomNavigation())));
                                }
                              });
                            } else {
                              var errMsg;
                              if (!_formEmail.currentState.validate())
                                errMsg = "Enter a valid Email Address";
                              else
                                errMsg = "You missed the password";
                              Fluttertoast.showToast(
                                  msg: errMsg,
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }
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
