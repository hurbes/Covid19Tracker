import 'package:flutter/material.dart';



final ThemeData lightTheme = new ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.grey,
    backgroundColor: Colors.grey.withOpacity(0.2),
    primaryColor: Colors.white,
    primaryColorLight: Colors.white,
    primaryColorDark: Colors.black,
    primaryColorBrightness: Brightness.light,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.black.withOpacity(0.7),
        fontFamily: "OpenSans",
        fontWeight: FontWeight.w300,
      ),
     bodyText1 : TextStyle(
        color: Colors.black.withOpacity(0.7),
        fontFamily: "OpenSans",
        fontWeight: FontWeight.w300,
      ),
      headline3: TextStyle(
        color: Colors.white70,
        fontFamily: "OpenSans",
        fontWeight: FontWeight.w700,
      ),
      headline4: TextStyle(
          color: Colors.black.withOpacity(0.6),
          fontFamily: "OpenSans",
          fontWeight: FontWeight.w300,
          fontSize: 20),
      headline5: TextStyle(
          fontSize: 30, color: Colors.white70, fontFamily: "OpenSans"),
      headline6: TextStyle(
          color: Colors.black87,
          fontFamily: "OpenSans",
          fontWeight: FontWeight.w700,
          fontSize: 25),
    ));

 final ThemeData darkTheme = new ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.grey,
    backgroundColor: Colors.black,
    primaryColor: Color(0xFF151515),
    primaryColorLight: Colors.black.withOpacity(0.9),
    primaryColorDark: Colors.white.withOpacity(0.8),
    primaryColorBrightness: Brightness.dark,
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white.withOpacity(0.7),
        fontFamily: "OpenSans",
        fontWeight: FontWeight.w300,
      ),
     bodyText1 : TextStyle(
        color: Colors.white.withOpacity(0.7),
        fontFamily: "OpenSans",
        fontWeight: FontWeight.w300,
      ),
      headline3: TextStyle(
        color: Colors.white70,
        fontFamily: "OpenSans",
        fontWeight: FontWeight.w700,
      ),
      headline4: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontFamily: "OpenSans",
          fontWeight: FontWeight.w300,
          fontSize: 20),
      headline5: TextStyle(
          fontSize: 30, color: Colors.white70, fontFamily: "OpenSans"),
      headline6: TextStyle(
          color: Colors.white.withOpacity(0.7),
          fontFamily: "OpenSans",
          fontWeight: FontWeight.w700,
          fontSize: 25),
    ));


class Styles {
   
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,

      backgroundColor: isDarkTheme ? Colors.black : Color(0xffF1F5FB),

      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),

      hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),

      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),

      focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
      cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
      ),
    );
    
  }
}