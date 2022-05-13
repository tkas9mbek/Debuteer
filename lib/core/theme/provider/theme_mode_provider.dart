import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service/shared_preferences_provider.dart';

final themeModeProvider = StateNotifierProvider<ThemeStateNotifier, ThemeMode>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);

  return ThemeStateNotifier(sharedPreferences: sharedPreferences);
});

class ThemeStateNotifier extends StateNotifier<ThemeMode> {
  ThemeStateNotifier({
    required this.sharedPreferences,
  }) : super(ThemeMode.light) {
    loadFromStorage();
  }

  late SharedPreferences sharedPreferences;

  void switchTheme() {
    ThemeMode next;

    if (state == ThemeMode.dark) {
      next = ThemeMode.light;
    } else {
      next = ThemeMode.dark;
    }

    state = next;
    sharedPreferences.setString('theme_mode', next.toString());
  }

  void loadFromStorage() {
    final themeString = sharedPreferences.get('theme_mode');

    state = themeString == null
        ? ThemeMode.light
        : ThemeMode.values.firstWhere((e) => e.toString() == themeString);
  }
}
