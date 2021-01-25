import 'package:flutter/cupertino.dart';

// I used write here the extension that my app will use.
// Like formatting the date, or using validator(valid phone or validate email)

extension WidgetExtension on Widget {

  Widget paddingHorizontal(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  Widget paddingVertical(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }
}
