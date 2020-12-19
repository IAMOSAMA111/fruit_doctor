import 'package:flutter/material.dart';
import 'package:flutter_doctor/Provider/test.dart';
import 'package:flutter_doctor/utilities/constants.dart';
import 'package:flutter_doctor/Provider/calculator.dart';
import 'package:provider/provider.dart';

/*class CalculateFertilizer extends StatelessWidget {
  static const String id = "CalculateFertilizer";
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<Test>(builder: (_, test, child) {
                if (test.enable) {
                  print('Controller enabled');
                  controller.value = test.textValue;
                }

                return TextField(
                  controller: controller,
                  decoration: InputDecoration(hintText: test.value),
                  onChanged: Provider.of<Test>(context).changeVal,
                );
              }),
              TextButton(
                onPressed: () {
//                  Provider.of<Calculator>(context, listen: false)
//                      .converterStringAdd();
                  Provider.of<Test>(context, listen: false).incrementVal();
                },
                child: Text('Press me'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/

class CalculateFertilizer extends StatelessWidget {
  static const String id = "CalculateFertilizer";
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Calculate"),
          backgroundColor: appbar_Color,
          centerTitle: true,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  "Number of Trees",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      ClipOval(
                        child: Material(
                          color: appbar_Color, // button color
                          child: IconButton(
                              splashColor: primary_Color,
                              icon: Icon(
                                Icons.remove,
                                color: Colors.white,
                                size: 27.5,
                              ),
                              onPressed: () {
                                Provider.of<Calculator>(context, listen: false)
                                    .converterStringSub();
                              }),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                          width: 230,
                          child: Consumer<Calculator>(
                            builder: (_, myProvider, child) {
                              textController.value = myProvider.textValue;
                              return TextFormField(
                                controller: textController,
                                decoration: new InputDecoration(
                                  labelText: "Numbers",
                                  fillColor: Colors.white,
                                  hintText: myProvider.value,

                                  border: new OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(25.0),
                                    borderSide: new BorderSide(),
                                  ),
                                  //fillColor: Colors.green
                                ),
                                validator: (val) {
                                  if (val.length == 0) {
                                    return "Numbers";
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.number,
                                style: new TextStyle(
                                  fontFamily: "Poppins",
                                ),
                              );
                            },
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      ClipOval(
                        child: Material(
                          color: appbar_Color, // button color
                          child: IconButton(
                            splashColor: primary_Color,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 27.5,
                            ),
                            onPressed:
                                Provider.of<Calculator>(context, listen: false)
                                    .converterStringAdd,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Size smaller than one unit is expressed as 0 \n Example half acre = 0.5",
                  style: TextStyle(color: Colors.black38),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: RaisedButton(
                  onPressed: () {
                    Provider.of<Calculator>(context, listen: false)
                        .buttonPressed();
                  },
                  color: appbar_Color,
                  textColor: Colors.white,
                  child: Text(
                    "Calculate",
                    style: TextStyle(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Consumer<Calculator>(
                      builder: (_, myText, child) {
                        return Text(
                          myText.text,
                          style: TextStyle(fontSize: 18),
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Consumer<Calculator>(
                        builder: (_, myElevation, child) {
                          return Card(
                            elevation: myElevation.elevationcard,
                            child: Container(
                              height: MediaQuery.of(context).size.height / 3,
                              width: MediaQuery.of(context).size.width - 50,
                              child: ListView(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 50),
                                        child: Text(
                                          myElevation.fertilizer,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 45),
                                        child: Text(
                                          myElevation.name,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 45),
                                        child: Text(
                                          myElevation.amount,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 50),
                                        child: Text(
                                          myElevation.fertilizer,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 45),
                                        child: Text(
                                          myElevation.name,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 45),
                                        child: Text(
                                          myElevation.amount,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 50),
                                        child: Text(
                                          myElevation.fertilizer,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 45),
                                        child: Text(
                                          myElevation.name,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 45),
                                        child: Text(
                                          myElevation.amount,
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*
* InkWell(
                          splashColor: primary_Color, // inkwell color
                          child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              )),
                          onTap: Provider.of<Calculator>(context, listen: false)
                              .converterStringAdd,
                        )
* */
