import 'package:flutter/material.dart';

class Sizes {
  static double fullWidth(BuildContext context) => MediaQuery.of(context).size.width;
  static double fullHeight(BuildContext context) => MediaQuery.of(context).size.height;
  static double courseCardHeight = 190;
  static double courseCardImageHeight = 93;
  static double courseCardWidth = courseCardImageHeight * 1.75;
  static double bottomBarButtonHeight = 45;
  static double courseLineHeight = 110;
  static double bottomNavIconsSize = 20;
}
