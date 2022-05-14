import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/service/shared_preferences_provider.dart';

final boardThemeProvider =
    StateNotifierProvider<BoardThemeNotifier, BoardColor>((ref) {
  final sp = ref.watch(sharedPreferencesProvider);

  return BoardThemeNotifier(sharedPreferences: sp);
});

class BoardThemeNotifier extends StateNotifier<BoardColor> {
  BoardThemeNotifier({
    required this.sharedPreferences,
  }) : super(BoardColor.green) {
    loadFromStorage();
  }

  late SharedPreferences sharedPreferences;

  void change(BoardColor scheme) {
    state = scheme;
    sharedPreferences.setString('board', scheme.toString());
  }

  void loadFromStorage() {
    final themeString = sharedPreferences.get('board');

    if (themeString != null) {
      state = BoardColor.values.firstWhere((e) => e.toString() == themeString);
    }
  }
}
