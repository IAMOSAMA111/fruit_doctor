import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctor/utilities/constants.dart';
class Login extends StatefulWidget {
  static const String id = 'Login';


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _phone;
  String _password;
  bool _rememberMe=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.green, Colors.greenAccent]
                )
            ),

          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Flexible(
                flex: 2,
                  child: Container(
                    child:ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        height: 150,
                        width: 150,
                        image: AssetImage('assets/images/fruits.jpg'),
                      ),
                    ) ,
                  )
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: zLoginBoxDecorationStyle,
                        height: 60.0,
                        width:MediaQuery.of(context).size.width - 100 ,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            this._phone = value;
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'CM Sans Serif',
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 18.0),
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            hintText: 'Enter your Number',
                            hintStyle: zLoginHintTextStyle,
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        decoration: zLoginBoxDecorationStyle,
                        height: 60.0,
                        width:MediaQuery.of(context).size.width - 100,
                        child: TextField(
                          obscureText: true,
                          onChanged: (value) {
                            this._password = value;
                          },
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'CM Sans Serif',
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 18.0),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.white,
                            ),
                            hintText: 'Enter your Password',
                            hintStyle: zLoginHintTextStyle,
                              ),
                            ),
                          ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 22.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Theme(
                              data: ThemeData(unselectedWidgetColor: kTealColor),
                              child: Checkbox(
                                value: _rememberMe,
                                checkColor: kTealColor,
                                activeColor: kScaffoldBackgroundColor,
                                onChanged: (value) {
                                  setState(() {
                                    _rememberMe = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top: 2.5),
                              child: Text(
                                'Keep me signed in',
                                style: zLoginLabelStyle.copyWith(color: kTealColor),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                                ButtonTheme(
                                  buttonColor: Colors.blueAccent,
                                  minWidth: 250,
                                  child: RaisedButton(

                                    shape:RoundedRectangleBorder(

                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    onPressed: (){},
                                    child: Text('Login', style: TextStyle(color: Colors.white
                                    , fontSize: 20),),
                                  ),
                                )
                          ],
                        ),

                      ),

                      SizedBox(
                        height: 60,
                      ),

                        ],
                      ),


                      Container(
                        height:MediaQuery.of(context).size.height/5 ,
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: Padding(padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ButtonTheme(
                                buttonColor: Colors.redAccent,
                                minWidth: 250,
                                child: RaisedButton(

                                  shape:RoundedRectangleBorder(

                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  onPressed: (){},
                                  child: Text('Sign up', style: TextStyle(color: Colors.white
                                      , fontSize: 20),),
                                ),
                              )
                            ],
                          ),

                        ),
                      )

                    ],
                  ),




            ],
          ),
          ),

    );

  }
}
