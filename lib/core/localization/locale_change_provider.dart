import 'package:hooks_riverpod/hooks_riverpod.dart';

final localeChangeProvider =
    StateNotifierProvider<LocaleChangeNotifier, bool>((ref) => LocaleChangeNotifier());

class LocaleChangeNotifier extends StateNotifier<bool> {
  LocaleChangeNotifier() : super(true);

  void trigger() {
    Future.delayed(const Duration(milliseconds: 75), () => state = !state);
  }
}
