import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class BottomNavigation extends StatefulWidget {
  static const String id ='BottomNavigation'  ;
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedPage =0;
  final _pageOption = [
    Text("Home", style: TextStyle(fontSize: 20),),
    Text("Community", style: TextStyle(fontSize: 20),),
    Text("Todoist", style: TextStyle(fontSize: 20),),
    Text("Profile", style: TextStyle(fontSize: 20),),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body:_pageOption[_selectedPage],
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.blueGrey,
              currentIndex: _selectedPage,
              onTap: (int index){
                setState(() {
                  _selectedPage = index;
                });
              },
              items: [

                BottomNavigationBarItem(

                  icon:FaIcon(FontAwesomeIcons.home,),
                  title: Text("Home"),
                ),
                BottomNavigationBarItem(
                  icon:FaIcon(FontAwesomeIcons.comment),
                  title: Text("Community"),
                ),
                BottomNavigationBarItem(
                  icon:FaIcon(FontAwesomeIcons.stickyNote),
                  title: Text("Todoist"),
                ),
                BottomNavigationBarItem(
                  icon:FaIcon(FontAwesomeIcons.user),
                  title: Text("Profile"),
                )

              ],
            ),
        ),
      ),
    );
  }
}

