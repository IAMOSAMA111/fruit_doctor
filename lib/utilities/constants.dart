import 'package:flutter/material.dart';


final kScaffoldBackgroundColor = Color(0xFFedf5f4);
final kLightTealColor = Color(0xffE9F2F1);
final kTealColor = Color(0xff45736A);
final kAmberColor = Color(0xffF2B035);
final kLightAmberColor = Color(0xffF2CA7E);
final kPeachColor = Color(0xffF2AA80);
final kMapsGreyColor = Color(0xFFf5f5f5);




final zFruitDoctorThemeData = ThemeData(
  backgroundColor: kScaffoldBackgroundColor,
  dialogBackgroundColor: kScaffoldBackgroundColor,
  scaffoldBackgroundColor: kScaffoldBackgroundColor,
);

final zLoginBoxDecorationStyle = BoxDecoration(
  color: kTealColor.withOpacity(0.8),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.green,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

final zLoginHintTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'CM Sans Serif',
);

final zLoginLabelStyle = TextStyle(
  color: kTealColor,
  fontWeight: FontWeight.bold,
  fontFamily: 'CM Sans Serif',
);

final zBottomNavBarTextStyle = TextStyle(
  fontSize: 22.0,
  color: Colors.white,
  fontFamily: 'CM Sans Serif',
);