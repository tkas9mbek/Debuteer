import 'package:flutter/material.dart';

@immutable
class LanguageData {
  const LanguageData({
    required this.locale,
    required this.flag,
    required this.name,
  });

  final Locale locale;
  final String flag;
  final String name;
}
