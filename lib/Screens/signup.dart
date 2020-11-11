import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_doctor/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_doctor/Screens/login.dart';

class Signup extends StatefulWidget {

  static const String id = 'Signup';
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _name;
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
                Padding(
                    padding: EdgeInsets.fromLTRB(220, 10, 0, 0),
                    child: ButtonTheme(
                      buttonColor: Colors.blueAccent,
                      minWidth: 100,
                      child: RaisedButton(

                        shape:RoundedRectangleBorder(

                            borderRadius: BorderRadius.circular(10)
                        ),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>(Login())));
                        },
                        child: Text('Login', style: TextStyle(color: Colors.white
                            , fontSize: 15),),
                      ),
                    )

                ),
                SizedBox(
                  height: 60,
                ),

                Container(
                  child:Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image(
                            height: 50,
                            width: 50,
                            image: AssetImage('assets/images/fruits.jpg'),
                          ),
                        ),
                        SizedBox(width: 5,),
                        Text("Fruit Doctor",
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
                              fontFamily:'', color: Colors.black
                          ),)
                      ],
                    ),
                  ) ,
                ),
                SizedBox(
                  height: 30,
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
                        keyboardType: TextInputType.text,
                        onChanged: (value) {
                          this._email = value;
                        },
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'CM Sans Serif',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 18.0),
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your name',
                          hintStyle: zLoginHintTextStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      decoration: zLoginBoxDecorationStyle,
                      height: 60.0,
                      width:MediaQuery.of(context).size.width - 100 ,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          this._email = value;
                        },
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'CM Sans Serif',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(top: 18.0),
                          prefixIcon: Icon(
                            Icons.alternate_email,
                            color: Colors.white,
                          ),
                          hintText: 'Enter your Email',
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

                        SizedBox(
                          height: 20,
                        ),
                        Padding(padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ButtonTheme(
                                buttonColor: Colors.redAccent,
                                minWidth: 200,
                                child: RaisedButton(

                                  shape:RoundedRectangleBorder(

                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  onPressed: (){},
                                  child: Text('Register', style: TextStyle(color: Colors.white
                                      , fontSize: 20),),
                                ),
                              ),

                            ],
                          ),

                        ),

                        SizedBox(
                          height: 20,
                        ),

                      ],
                    ),

                    Text("Or login with ", style: TextStyle(fontSize: 20, color: Colors.black),),

                    SizedBox(
                      height: 20,
                    ),

                    Container(
                      height:MediaQuery.of(context).size.height/9 ,
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: Padding(padding: const EdgeInsets.only(top: 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child:Image( height: 40,
                                      image: AssetImage('assets/images/facebookicon.png')
                                  ),
                                ),

                                SizedBox(width: 40,),
                                GestureDetector(
                                  onTap: (){

                                  },

                                  child: Image( height: 40,
                                      image: AssetImage('assets/images/googleicon.png')
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),

                      ),
                    )

                  ],
                ),




              ],
            ),
          ),
        )
    );
  }
}

