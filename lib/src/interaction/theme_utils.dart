import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/resources/color_theme.dart';
import 'package:themovie_flutter/src/resources/fonts.dart';

class MyThemes {
  static final ThemeData darkTheme = new ThemeData(
    fontFamily: Fonts.SF_UI_TEXT,
    brightness: Brightness.dark,
    bottomAppBarColor: ColorTheme.primary,
    cursorColor: ColorTheme.light_grey,
    backgroundColor: ColorTheme.primary,
    buttonColor: ColorTheme.light_brown,
    disabledColor: ColorTheme.primary,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontFamily: Fonts.SF_UI_TEXT,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline2: TextStyle(
        fontFamily: Fonts.ACLONICA,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      subtitle1: TextStyle(
        fontFamily: Fonts.SF_UI_TEXT,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      subtitle2: TextStyle(
        fontFamily: Fonts.SF_UI_TEXT,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
      bodyText1:TextStyle(
        fontFamily: Fonts.SF_UI_TEXT,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      ),
      bodyText2:TextStyle(
        fontFamily: Fonts.SF_UI_TEXT,
        fontWeight: FontWeight.normal,
        fontSize: 14,
        color: ColorTheme.light_brown,
      ),
    ),
    primaryColor: ColorTheme.primaryDark,
    accentColor: ColorTheme.primaryDark,
    accentColorBrightness: Brightness.dark,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
