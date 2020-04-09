import 'package:flutter/material.dart';



final ThemeData lightTheme = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.grey,
    backgroundColor: Colors.grey.withOpacity(0.2),
    primaryColor: Colors.black,
    primaryColorLight: Colors.white,
    primaryColorDark: Colors.black,
    primaryColorBrightness: Brightness.light,
    fontFamily: "OpenSans",
  );

 final ThemeData darkTheme = new ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    backgroundColor: Colors.black,
    cardColor: Color(0xFF151515),
    primaryColor: Colors.white,
    primaryColorLight: Colors.black.withOpacity(0.9),
    primaryColorDark: Colors.white.withOpacity(0.8),
    primaryColorBrightness: Brightness.dark,
    );

