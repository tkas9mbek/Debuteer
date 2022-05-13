import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service/shared_preferences_provider.dart';

final flexThemeProvider =
    StateNotifierProvider<FlexThemeNotifier, FlexScheme>((ref) {
  final sp = ref.watch(sharedPreferencesProvider);

  return FlexThemeNotifier(sharedPreferences: sp);
});

class FlexThemeNotifier extends StateNotifier<FlexScheme> {
  FlexThemeNotifier({
    required this.sharedPreferences,
  }) : super(FlexScheme.bahamaBlue) {
    loadFromStorage();
  }

  late SharedPreferences sharedPreferences;

  void change(FlexScheme scheme) {
    state = scheme;
    sharedPreferences.setString('theme', scheme.toString());
  }

  void loadFromStorage() {
    final themeString = sharedPreferences.get('theme');

    if (themeString != null) {
      state = FlexScheme.values.firstWhere((e) => e.toString() == themeString);
    }
  }
}
