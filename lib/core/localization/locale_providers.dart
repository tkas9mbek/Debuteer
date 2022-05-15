import 'dart:io';
import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'language_data_provider.dart';

/**
    Local of the platform (e.g. phone)
 */
final platformLocaleProvider = Provider<Locale>((ref) {
  final platformLocaleName = Platform.localeName;
  String languageCode;

  if (Platform.isIOS) {
    languageCode = platformLocaleName;
  } else {
    languageCode = platformLocaleName.substring(0, platformLocaleName.indexOf('_'));
  }

  return Locale(languageCode);
});

/**
    The default locale if no locale is selected yet
 */
final fallbackLocaleProvider = Provider<Locale>((ref) {
  final platformLocale = ref.watch(platformLocaleProvider);
  final supportedLocales = ref.watch(supportedLocalesProvider);

  return supportedLocales.contains(platformLocale)
      ? platformLocale
      : supportedLocales[0];
});

final supportedLocalesProvider = Provider<List<Locale>>((ref) {
  final supportedLanguages = ref.watch(languageDataProvider);

  return supportedLanguages.map((e) => e.locale).toList();
});

final supportedLanguageCodesProvider = Provider<List<String>>((ref) {
  final supportedLanguages = ref.watch(supportedLocalesProvider);

  return supportedLanguages.map((e) => e.languageCode).toList();
});
