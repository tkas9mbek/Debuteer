import 'package:flutter/material.dart';

class MyFont {
  static TextStyle style({
    TextStyle? textStyle,
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? height,
  }) => TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    height: height,
  );

  static TextStyle bottomNavigationBar(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return style(
      color: colorScheme.onPrimary,
      fontSize: 11,
    );
  }

}
