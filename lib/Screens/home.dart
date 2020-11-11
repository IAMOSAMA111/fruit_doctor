import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  static const String id = 'Home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey _bottomNavigationKey = GlobalKey();

  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Fruit Doctor'),
        centerTitle: true,
        backgroundColor: Color(0xff45736A),
      ),
      body:Column(
        children: [
          SizedBox(
            height:MediaQuery.of(context).size.height/3,
            child: DefaultTabController(

              length: 4,
              child: Column(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints.expand(height: 50),
                    child: TabBar(
                        indicatorColor: Colors.green,
                        isScrollable: true,

                        tabs: [
                          Tab(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage('assets/images/home/apple1.png'),),
                              SizedBox(width: 40,)
                            ],
                          ),),
                          Tab(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage('assets/images/home/orange.png'),),
                              SizedBox(width:40,)
                            ],
                          ),),
                          Tab(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage('assets/images/home/pomy.png'),),
                              SizedBox(width: 40,)
                            ],
                          ),),
                          Tab(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(image: AssetImage('assets/images/home/waterMellon.png'),),
                              SizedBox(width: 40,)
                            ],
                          ),),

                        ]),
                  ),
                  Expanded(
                    child: Container(
                      child: TabBarView(children: [
                        Container(
                          color: Colors.redAccent,
                          child: Text("Apple Body"),
                        ),
                        Container(
                          color: Colors.deepOrangeAccent,
                          child: Text("Orange Body"),
                        ),
                        Container(
                          color: Colors.red,
                          child: Text("pomegranate Body"),
                        ),
                        Container(
                          color: Colors.green,
                          child: Text("Water Mellon Body"),
                        ),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Card(

              elevation: 10,
              child: Container(
                child:Column(
                  children: [
                    Row(
                      children: [
                        Text("HEAL YOUR CROP")
                      ],
                    ),
                    Row(
                      children: [
                        Image(image: null),
                        Image(image: null),
                        Image(image: null),
                      ],
                    ),
                    Row(
                      children: [
                        RaisedButton(onPressed: null,)
                      ],
                    )
                  ],
                ) ,
              ),
            ),
          ),

          SizedBox(
            height: 5.0,
          ),

          Card(
            elevation: 10.0,
            child: Container(
              child: Column(

              ),
            ),
          )
        ],
      ),







      /*appBar: AppBar(
        title: Text('Fruit Doctor'),
        centerTitle: true,
        backgroundColor: Color(0xff45736A),
      ),*//*

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: Column(
          children: [
            AppBar(
              title: Text('Fruit Doctor'),
              centerTitle: true,
              backgroundColor: Color(0xff45736A),
            ),
            CurvedNavigationBar(
              animationCurve: Curves.linear,
              animationDuration: Duration(milliseconds: 0),
              backgroundColor: Color(0xff45736A),
              height: 20,
              key: _bottomNavigationKey,
              items: <Widget>[
                Container(
                  height: 20,
                  width: 20,
                  child: FittedBox( fit: BoxFit.contain,

                    child: Image(
                      height: 20,
                      image: AssetImage('assets/images/home/apple1.png'),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  child: FittedBox( fit: BoxFit.contain,

                    child: Image(
                      height: 20,
                      image: AssetImage('assets/images/home/apple1.png'),
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 20,
                  child: FittedBox( fit: BoxFit.contain,

                    child: Image(
                      height: 50,
                      image: AssetImage('assets/images/home/apple1.png'),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: FittedBox( fit: BoxFit.contain,

                    child: Image(
                      height: 20,
                      image: AssetImage('assets/images/home/apple1.png'),
                    ),
                  ),
                ),


              ],
              onTap: (index) {
                setState(() {
                  _page = index;
                });
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Color(0xff45736A),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(_page.toString(), textScaleFactor: 10.0),
              RaisedButton(
                child: Text('Go To Page of index 1'),
                onPressed: () {
                  //Page change using state does the same as clicking index 1 navigation button
                  final CurvedNavigationBarState navBarState =
                      _bottomNavigationKey.currentState;
                  navBarState.setPage(1);
                },
              )
            ],
          ),
        ),
      ),*/
    );

  }
}
