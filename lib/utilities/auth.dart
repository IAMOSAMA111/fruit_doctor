library fruit_doctor.auth;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:flutter_doctor/Screens/bottomnav.dart';

_Auth a = _Auth.getInstance();

enum E { username, email, photoURL }

class _Auth {
  static _Auth _instance = new _Auth();
  bool isLoggedIn = false;
  List<String> userProfile = List<String>(3);
  Map userPrf;
  static final facebookLogin = FacebookLogin();
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _Auth() {}

  static _Auth getInstance() {
    if (_instance == null) {
      _instance = new _Auth();
    }
    return _instance;
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

/*
  _logout(){
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }
  */

  takeToHome(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                (userProfile != null ? BottomNavigation() : () => {})));
  }
}
