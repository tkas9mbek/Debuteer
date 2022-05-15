import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/localization/locale_providers.dart';
import 'core/routing/router_provider.dart';
import 'core/service/shared_preferences_provider.dart';
import 'core/theme/provider/flex_theme_provider.dart';
import 'core/theme/provider/theme_mode_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('assets/fonts/UFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const EasyLocalizator(),
    ),
  );
}

class EasyLocalizator extends ConsumerWidget {
  const EasyLocalizator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final supportedLocales = ref.watch(supportedLocalesProvider);
    final fallbackLocale = ref.watch(fallbackLocaleProvider);

    return EasyLocalization(
      supportedLocales: supportedLocales,
      path: 'assets/languages',
      fallbackLocale: fallbackLocale,
      child: const MyApp(),
    );
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final flexTheme = ref.watch(flexThemeProvider);
    final lightTheme = FlexColorScheme.light(scheme: flexTheme).toTheme;
    final darkTheme = FlexColorScheme.dark(scheme: flexTheme).toTheme;
    final fallbackLocale = ref.watch(fallbackLocaleProvider);
    final languageCodes = ref.watch(supportedLanguageCodesProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localeResolutionCallback: (locale, supportedLocales) {
        if (!languageCodes.contains(locale?.languageCode)) {
          context.setLocale(fallbackLocale);

          return context.fallbackLocale;
        }

        return locale;
      },
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
