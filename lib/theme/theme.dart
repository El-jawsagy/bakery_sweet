import 'package:flutter/material.dart';

class CustomColors {
  static const Color mainColor = Color(0xff99101A);
  static const Color secondColor = Color(0xffC1272D);
  static const Color backgroundCatColor = Color(0xffF2E6E9);
  static const Color greyColor = Color(0xffE1E1E1);
  static const Color whiteColor = Color(0xffFFFFFF);

  static const Color transparentColor = Colors.transparent;

  static const Color subTitleColor = Color(0xff666666);
  static const Color titleBlackColor = Color(0xff000000);
}

ThemeData lightTheme = ThemeData(
  primaryColor: CustomColors.mainColor,
  iconTheme: IconThemeData(
    color: CustomColors.titleBlackColor,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 28,
      fontFamily: "coconnextarabic",
      color: CustomColors.subTitleColor,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: "coconnextarabic",
      color: CustomColors.titleBlackColor,
      fontSize: 22,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "coconnextarabic",
      color: CustomColors.subTitleColor,
      fontSize: 18,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.w800,
      fontFamily: "coconnextarabic",
      color: CustomColors.subTitleColor,
      fontSize: 14,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: "coconnextarabic",
      color: CustomColors.subTitleColor,
      fontSize: 12,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: "coconnextarabic",
      color: CustomColors.subTitleColor,
      fontSize: 10,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.bold,
      fontFamily: "coconnextarabic",
      color: CustomColors.subTitleColor,
      fontSize: 10,
    ),
  ),
);
