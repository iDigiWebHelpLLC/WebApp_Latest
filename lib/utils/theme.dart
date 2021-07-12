import 'package:flutter/material.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primaryColor: Colors.black,
    primaryColorDark: Colors.black,
    accentColor: Colors.black,
    fontFamily: 'Montserrat',
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    appBarTheme: AppBarTheme(color: Colors.white),

    iconTheme: IconThemeData(color: Colors.black),
    buttonColor: Colors.black,

    //Theming for text
    textTheme: TextTheme(
      headline5: TextStyle(fontFamily: "Montserrat"),
      headline4: TextStyle(fontFamily: "Montserrat"),
      headline3: TextStyle(fontFamily: "Montserrat"),
      headline2: TextStyle(fontFamily: "Montserrat"),
      headline1: TextStyle(fontFamily: "Montserrat"),
      headline6: TextStyle(fontFamily: "Montserrat"),
      subtitle1: TextStyle(fontFamily: "Montserrat"),
      button: TextStyle(fontFamily: "Montserrat"),
      caption: TextStyle(fontFamily: "Montserrat"),
      bodyText2: TextStyle(fontFamily: "Montserrat"),
      bodyText1: TextStyle(fontFamily: "Montserrat"),
    ),
  );
}
