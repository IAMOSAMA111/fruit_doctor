import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_doctor/Screens/calculate_fertilizer.dart';
import 'package:flutter_doctor/Screens/todoist.dart';
import 'package:flutter_doctor/Screens/weather.dart';
import 'package:flutter_doctor/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'weather.dart';
import 'note_home.dart';

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
        _currentAddress = " ${place.subAdministrativeArea}";
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
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: DefaultTabController(
              length: 4,
              child: Column(
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints.expand(height: 50),
                    child: TabBar(
                        indicatorColor: Color(0xff45736A),
                        isScrollable: true,
                        tabs: [
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/images/home/apple1.png'),
                                ),
                                SizedBox(
                                  width: 40,
                                )
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/images/home/orange.png'),
                                ),
                                SizedBox(
                                  width: 40,
                                )
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image:
                                      AssetImage('assets/images/home/pomy.png'),
                                ),
                                SizedBox(
                                  width: 40,
                                )
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: AssetImage(
                                      'assets/images/home/waterMellon.png'),
                                ),
                                SizedBox(
                                  width: 40,
                                )
                              ],
                            ),
                          ),
                        ]),
                  ),
                  Expanded(
                    child: Container(
                      child: TabBarView(children: [
                        homeTop(context, Colors.redAccent,
                            CalculateFertilizer(), Todoist()),
                        homeTop(context, Colors.deepOrangeAccent,
                            CalculateFertilizer(), Todoist()),
                        homeTop(context, Colors.red, CalculateFertilizer(),
                            Todoist()),
                        homeTop(context, appbar_Color, CalculateFertilizer(),
                            Todoist()),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Card(
              elevation: 15,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "HEAL YOUR CROP",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w900),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                              image: AssetImage('assets/images/home/ins.png')),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonTheme(
                          buttonColor: Color(0xff45736A),
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
                    )
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Weather()));
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
                          _currentAddress != null && _currentPosition != null
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
                              date.toString(),
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
                          temp != null ? temp.toString() + "\u00B0" : "Loading",
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
          )
        ],
      ),
    );
  }

  Widget homeTop(context, Color color, route1, route2) {
    return Container(
        color: color,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => route1));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Container(
                      width: (MediaQuery.of(context).size.width / 3) + 30,
                      height: MediaQuery.of(context).size.height / 8,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  FontAwesomeIcons.calculator,
                                  color: Colors.black54,
                                  size: 30,
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
                                fontSize: 16, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => route2));
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Container(
                      width: (MediaQuery.of(context).size.width / 3) + 30,
                      height: MediaQuery.of(context).size.height / 8,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.lightGreen,
                                child: Icon(
                                  FontAwesomeIcons.bug,
                                  color: Colors.black54,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Pest and Diseases ",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
