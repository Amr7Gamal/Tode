import 'package:flutter/material.dart';

class MyTheme {
  static final Color lightGreenColor = Color(0xffDFECDB);
  static final Color lightBlueColor = Color(0xFF5D9CEC);
  static final Color darkBlueColor = Color(0x060E1E);
  static final Color darkBlueBlackColor = Color(0xff141922);
  static final Color greenColor = Color(0xff61E757);
  static final Color whiteColor = Colors.white;
  static final Color blackColor = Colors.black;
  static final Color black38Color = Colors.black38;
  static final Color redColor = Colors.red;

  static final ThemeData lightTheme = ThemeData(
      primaryColor: lightBlueColor,
      backgroundColor: whiteColor,
      scaffoldBackgroundColor: lightGreenColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedIconTheme: IconThemeData(color: lightBlueColor),
        unselectedIconTheme: IconThemeData(color: black38Color),
        selectedItemColor: lightBlueColor,
        unselectedItemColor: black38Color,
      ),
      textTheme: TextTheme(
          headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          headline2: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: blackColor),
          headline3: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: lightBlueColor),
          headline4: TextStyle(fontSize: 14, color: blackColor)));

  static final ThemeData darkTheme = ThemeData(
      primaryColor: lightBlueColor,
      backgroundColor: darkBlueBlackColor,
      scaffoldBackgroundColor: darkBlueColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedIconTheme: IconThemeData(color: lightBlueColor),
        unselectedIconTheme: IconThemeData(color: whiteColor),
        selectedItemColor: darkBlueBlackColor,
        unselectedItemColor: blackColor,
      ),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: whiteColor),
          headline2: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: whiteColor),
          headline3: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: whiteColor),
          headline4: TextStyle(fontSize: 14, color: whiteColor)));
}
