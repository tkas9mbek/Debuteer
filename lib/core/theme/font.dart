import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyFont {
  static TextStyle style({
    TextStyle? textStyle,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? height,
    TextDecoration? decoration,
  }) =>
      GoogleFonts.nunito(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
        height: height,
        decoration: decoration,
      );

  static TextStyle banner(BuildContext context) => style(
        fontSize: 26,
        fontWeight: FontWeight.w900,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      );

  static TextStyle drawer(BuildContext context) => style(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onBackground,
      );

  static TextStyle header(BuildContext context) => style(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.primary,
      );
}
