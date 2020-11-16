library fruit_doctor.auth;

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;
import 'package:flutter_doctor/Screens/bottomnav.dart';

Auth a = new Auth();

class Auth {
  bool isLoggedIn = false;
  Map userProfile;
  static final facebookLogin = FacebookLogin();

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
        userProfile = profile;
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
    isLoggedIn = false;
    userProfile = null;
    print('logged out');
  }

  takeToHome(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                (userProfile != null ? BottomNavigation() : () => {})));
  }
}
