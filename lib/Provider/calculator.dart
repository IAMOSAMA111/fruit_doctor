import 'dart:convert';

import 'package:flutter/material.dart';

class Calculator with ChangeNotifier {
  double val1;
  bool pressed = false;
  String text = " ";
  String fertilizer = " ";
  String name = " ";
  String amount = " ";

  double elevationcard = 0;

  Calculator() {
    val1 = 0;
  }

  String get value => val1.toString();
  TextEditingValue get textValue => TextEditingValue(text: val1.toString());

  void converterStringAdd() {
    val1 += 0.5;
    notifyListeners();
  }

  converterStringSub() {
    if (val1 != 0) {
      val1 = val1 - 0.5;
    }
    notifyListeners();
  }

  buttonPressed() {
    pressed = true;
    text = "Selected Area is $val1";
    fertilizer = "Fertilizer";
    name = "Urea";
    amount = "3.5 kg";
    elevationcard = 20;
    notifyListeners();
  }
}
