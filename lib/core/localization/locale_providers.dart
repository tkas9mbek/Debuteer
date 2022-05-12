import 'dart:io';
import 'dart:ui';

import 'package:hooks_riverpod/hooks_riverpod.dart';

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

/**
    Provides the list of the supported current locales and language codee.
 */
final supportedLanguageCodesProvider = Provider<List<String>>((ref) => const [
    'en',
  ],
);

final supportedLocalesProvider = Provider<List<Locale>>((ref) {
  final supportedLanguages = ref.watch(supportedLanguageCodesProvider);

  return supportedLanguages.map(Locale.new).toList();
});
