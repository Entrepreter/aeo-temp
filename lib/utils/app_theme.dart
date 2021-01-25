import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'colors_helper.dart';

class MyAppTheme {
  //this is where you write the app design related stuff, that will be applied throughout the app

  static final AppBarTheme _appBarTheme = AppBarTheme(
    color: backgroundColor,
    brightness: Brightness.light,
    actionsIconTheme: IconThemeData(color: kPrimaryColor),
    iconTheme: IconThemeData(color: kPrimaryColor),
    elevation: 0
  );

  static final themeData = ThemeData(
    primaryColor: kPrimaryColor,
    appBarTheme: _appBarTheme,
    scaffoldBackgroundColor: backgroundColor,
    cardColor: Colors.white
  );
}
