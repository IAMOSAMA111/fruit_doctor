import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_doctor/Screens/weather.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'weather.dart';
import 'package:flutter_doctor/utilities/constants.dart';

class Home extends StatefulWidget {
  static const String id = 'Home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey _bottomNavigationKey = GlobalKey();

  //location code
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    this.getWeatherInfo();
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress = " ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
  //weather code

  var temp;
  var description;

  Future getWeatherInfo() async {
    http.Response response = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?q=Islamabad&units=metric&appid=0437d87a63a252bcfeadc3cb929537f4');
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
    });
  }

  // date code
  static final DateTime now = DateTime.now();
  List months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'JunE',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  var current_mon = now.month;
  var date = now.day;
  var time = now.hour;

  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruit Doctor'),
        centerTitle: true,
        backgroundColor: primary_Color,
      ),
      body: Container(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints.expand(height: 60),
                    child: TabBar(
                        indicatorColor: primary_Color, // Color(0xff45736A),
                        isScrollable: true,
                        tabs: [
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Image(
                                  image: AssetImage(
                                      'assets/images/home/apple1.png'),
                                ),
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Image(
                                  image: AssetImage(
                                      'assets/images/home/orange.png'),
                                ),
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Image(
                                  image:
                                      AssetImage('assets/images/home/pomy.png'),
                                ),
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Image(
                                  image: AssetImage(
                                      'assets/images/home/waterMellon.png'),
                                ),
                                SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                          )
                        ]),
                  ),
                  Expanded(
                    child: Container(
                      child: TabBarView(children: [
                        Container(
                            color: Colors.redAccent,
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 0, 8, 0),
                                        child: Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3) +
                                              30,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 25,
                                                    backgroundColor:
                                                        Colors.redAccent,
                                                    child: Icon(
                                                      FontAwesomeIcons
                                                          .calculator,
                                                      color: Colors.white,
                                                      size: 22,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Calculate Fertilizer",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 0, 8, 0),
                                        child: Container(
                                          width: (MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3) +
                                              30,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              8,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  CircleAvatar(
                                                    radius: 25,
                                                    backgroundColor:
                                                        Colors.redAccent,
                                                    child: Icon(
                                                      FontAwesomeIcons.bug,
                                                      color: Colors.white,
                                                      size: 22,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Pests and Diseases",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          color: Colors.deepOrangeAccent,
                          child: Text("Orange Body"),
                        ),
                        Container(
                          color: Colors.red,
                          child: Text("pomegranate Body"),
                        ),
                        Container(
                          color: Color(0xff45736A),
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
              child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.height * 0.01),
                child: Card(
                  elevation: 15,
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "HEAL YOUR FRUITS",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 8,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                  image:
                                      AssetImage('assets/images/home/ins.png')),
                              SizedBox(width: 6)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ButtonTheme(
                              buttonColor: primary_Color,
                              minWidth: 300,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute());
                                },
                                child: Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Icon(
                                        FontAwesomeIcons.camera,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Open camera',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Weather()));
                },
                child: Card(
                  elevation: 15.0,
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              _currentAddress != null &&
                                      _currentPosition != null
                                  ? _currentAddress + ","
                                  : "loading",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              months[current_mon - 1].toString() +
                                  " " +
                                  date.toString() +
                                  "  " +
                                  time.toString(),
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.cloudSunRain,
                              size: 30,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              temp != null
                                  ? temp.toString() + "52\u00B0C"
                                  : "Loading",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.blueGrey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                description != null
                                    ? description.toString()
                                    : "Loading",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          )),
        ],
      )),

      /*appBar: AppBar(
        title: Text('Fruit Doctor'),
        centerTitle: true,
        backgroundColor: Color(0xff45736A),
      ),*/ /*

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
