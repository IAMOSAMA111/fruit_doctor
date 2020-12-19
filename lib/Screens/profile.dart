import 'package:flutter/material.dart';
import 'package:flutter_doctor/utilities/constants.dart';
import 'package:flutter_doctor/utilities/auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter_doctor/Screens/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  static const String id = 'Profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                          auth.a.isLoggedIn
                              ? auth.a.userProfile[auth.E.photoURL.index] !=
                                      null
                                  ? auth.a.userProfile[auth.E.photoURL.index]
                                  : 'https://p.kindpng.com/picc/s/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png'
                              : 'https://p.kindpng.com/picc/s/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png',
                          height: 50,
                          width: 50),
                      SizedBox(height: 10),
                      Text(
                          auth.a.isLoggedIn
                              ? auth.a.userProfile[auth.E.username.index]
                              : 'Anonymous',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 10),
                      Text(
                        auth.a.isLoggedIn
                            ? auth.a.userProfile[auth.E.email.index] != null
                                ? auth.a.userProfile[auth.E.email.index]
                                : 'you@somewhere.com'
                            : 'you@somewhere.com',
                        style: TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      ButtonTheme(
                          buttonColor: secondary_Color,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            onPressed: () async {
                              auth.a.logout();
                              SharedPreferences sharepref = await SharedPreferences.getInstance();
                              sharepref.setBool("loggedin", false);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => (Welcome())));
                            },
                            child: Text(
                              'LOG OUT',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          )),
                    ]))));
  }
}
