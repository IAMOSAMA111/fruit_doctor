library fruit_doctor.auth;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:flutter_doctor/Screens/bottomnav.dart';
import 'package:flutter_doctor/Screens/welcome.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

Auth a = Auth.getInstance();
enum E { username, email, photoURL }

class Auth {
  Dio dio = new Dio();
  static Auth _instance;
  bool isLoggedIn = false;
  List<String> userProfile = List<String>(3);
  Map userPrf;
  static final facebookLogin = FacebookLogin();
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Auth._() {}

  static Auth getInstance() {
    if (_instance == null) {
      _instance = new Auth._();
    }
    return _instance;
  }

  loginWithLocalAccount(email, password) async {
    try {
      return await dio.post('https://fruitdoctor.herokuapp.com/authenticate',
          data: {"email": email, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  addNewUser(email, password, name) async {
    try {
      return await dio.post('https://fruitdoctor.herokuapp.com/adduser',
          data: {"email": email, "name": name, "password": password},
          options: Options(contentType: Headers.formUrlEncodedContentType));
    } on DioError catch (e) {
      Fluttertoast.showToast(
          msg: e.response.data['msg'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  getinfo(token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    return await dio.get('https://fruitdoctor.herokuapp.com/getinfo');
  }

  loginWithFB(BuildContext context) async {
    final result = await facebookLogin.logInWithReadPermissions(['email']);
    //AccessToken accessToken = AccessToken.getCurrentAccessToken();
    //boolean isLoggedIn = accessToken != null && !accessToken.isExpired();
    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
        final profile = JSON.jsonDecode(graphResponse.body);
        takeToHome(context);
        print(profile);
        userPrf = profile;
        //setting the user data fields
        userProfile[E.username.index] = userPrf['name'];
        userProfile[E.email.index] = userPrf['email'];
        userProfile[E.photoURL.index] = userPrf['picture']['data']['url'];

        isLoggedIn = true;
        break;

      case FacebookLoginStatus.cancelledByUser:
        isLoggedIn = false;
        break;
      case FacebookLoginStatus.error:
        isLoggedIn = false;
        break;
    }
  }

  logout() async {
    facebookLogin.logOut();
    _googleSignIn.signOut();
    isLoggedIn = false;
    //userProfile = null;
    print('logged out');
  }

  loginWithGoogle(BuildContext context) async {
    try {
      await _googleSignIn.signIn();
      userProfile[E.username.index] = _googleSignIn.currentUser.displayName;
      userProfile[E.email.index] = _googleSignIn.currentUser.email;
      userProfile[E.photoURL.index] = _googleSignIn.currentUser.photoUrl;
      takeToHome(context);
      isLoggedIn = true;
    } catch (err) {
      print(err);
    }
  }

  takeToHome(BuildContext context) async {
    //Popping all the previous pages because we dont want to take the user back to login page if presses the back button
    SharedPreferences sharepref = await SharedPreferences.getInstance();
    sharepref.setBool("loggedin", true);
    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.pop(
        context, MaterialPageRoute(builder: (context) => (Welcome())));
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                (userProfile != null ? BottomNavigation() : () => {})));
  }
}
