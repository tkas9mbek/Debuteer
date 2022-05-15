import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'language_data.dart';

final languageDataProvider = Provider<List<LanguageData>>(
  (ref) => [
    const LanguageData(
      locale: Locale('en'),
      flag: '🇺🇸',
      name: 'English',
    ),
    const LanguageData(
      locale: Locale('ru'),
      flag: '🇷🇺',
      name: 'Русский',
    ),
  ],
);
