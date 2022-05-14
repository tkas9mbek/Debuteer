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

  static TextStyle drawer(BuildContext context) => style(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Theme.of(context).colorScheme.onPrimary,
      );

  static TextStyle link(BuildContext context) => style(
        color: Theme.of(context).colorScheme.onPrimary,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      );
}
