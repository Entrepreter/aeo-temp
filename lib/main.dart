import 'package:aeo_logic/ui/main_page.dart';
import 'package:aeo_logic/utils/app_theme.dart';
import 'package:aeo_logic/utils/colors_helper.dart';
import 'package:aeo_logic/utils/no_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      systemNavigationBarColor: backgroundColor,
      systemNavigationBarIconBrightness: Brightness.dark
    ));
    return MaterialApp(
      title: 'Assessment',
      theme: MyAppTheme.themeData,
      debugShowCheckedModeBanner: false,
      home: ScrollConfiguration(
        child: MainPage(),
        behavior: MyBehavior(),
      ),
    );
  }
}
