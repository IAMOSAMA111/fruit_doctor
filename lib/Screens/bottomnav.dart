//import 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_doctor/Screens/scraper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_doctor/Screens/home.dart';
import 'package:flutter_doctor/Screens/profile.dart';
import 'package:flutter_doctor/utilities/constants.dart';
import 'package:flutter_doctor/Screens/todoist.dart';

class BottomNavigation extends StatefulWidget {
  Map up;
  static const String id = 'BottomNavigation';

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedPage = 0;
  String name;

  final _pageOption = [
    Home(),
    Text(
      "Community",
      style: TextStyle(fontSize: 20),
    ),
    Todoist(),
    ScraperScreen(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Fruit Doctor'),
            centerTitle: true,
            backgroundColor: Color(0xff45736A),
          ),
          body: _pageOption[_selectedPage],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: primary_Color,
            unselectedItemColor: Colors.blueGrey,
            currentIndex: _selectedPage,
            onTap: (int index) {
              setState(() {
                _selectedPage = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: FaIcon(
                  FontAwesomeIcons.home,
                ),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.comment),
                title: Text("Community"),
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.stickyNote),
                title: Text("Todoist"),
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.globe),
                title: Text("Pundit"),
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.user),
                title: Text("Profile"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
