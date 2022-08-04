import 'package:flutter/material.dart';

class ScreenSize {
  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getHeightWithoutAppBar(BuildContext context) {
    return MediaQuery.of(context).size.height - AppBar().preferredSize.height;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
