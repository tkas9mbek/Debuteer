import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../colors.dart';

ThemeData _lightTheme = ThemeData(
colorScheme: ColorScheme(
primary: MyColors.neonMagentaAccent,
onPrimary: Colors.white,
secondary: MyColors.apricotAccent,
onSecondary: Colors.white,
surface: MyColors.apricotNeonMagentaMix,
onSurface: Colors.black,
background: MyColors.apricot,
onBackground: Colors.black,
error: Colors.red,
onError: Colors.white,
brightness: Brightness.light,
),
textTheme: const TextTheme(
bodyText1: TextStyle(
color: Colors.white,
),
),
);

ThemeData _darkTheme = ThemeData(
colorScheme: ColorScheme(
primary: MyColors.navy,
onPrimary: Colors.white,
secondary: MyColors.purpleLight,
onSecondary: Colors.white,
surface: MyColors.navyDark,
onSurface: Colors.white,
background: MyColors.purpleLight,
onBackground: Colors.white,
error: Colors.red,
onError: Colors.white,
brightness: Brightness.light,
),
textTheme: const TextTheme(
bodyText1: TextStyle(
color: Colors.white,
),
),
);

final lightThemeProvider = Provider<ThemeData>((ref) => _lightTheme);
final darkThemeProvider = Provider<ThemeData>((ref) => _darkTheme);