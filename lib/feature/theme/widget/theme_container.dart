import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/font.dart';
import '../../../core/theme/provider/flex_theme_provider.dart';
import '../../../core/theme/provider/theme_mode_provider.dart';
import '../../../core/theme/styles.dart';

class ThemeContainer extends ConsumerWidget {
  const ThemeContainer({
    required this.scheme,
    Key? key,
  }) : super(key: key);

  final FlexScheme scheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final mode = ref.watch(themeModeProvider);
    final flexTheme = ref.watch(flexThemeProvider);
    final theme = mode == ThemeMode.dark
        ? FlexColorScheme.dark(scheme: scheme).toTheme
        : FlexColorScheme.light(scheme: scheme).toTheme;
    final beforeCapitalLetter = RegExp('(?=[A-Z])');
    final parts = scheme.name.split(beforeCapitalLetter);
    var name = '';

    for (final part in parts) {
      name += '${part.capitalize} ';
    }

    return InkWell(
      onTap: () => ref.read(flexThemeProvider.notifier).change(scheme),
      borderRadius: Styles.cardGeneralRadius,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: Styles.cardGeneralRadius,
          color: theme.primaryColor,
          border: flexTheme == scheme ? Border.all(
            color: colorScheme.onPrimary,
            width: 0.75,
          ) : null,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: MyFont.style(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            if (flexTheme == scheme) ...[
              Icon(
                FontAwesomeIcons.solidCircleCheck,
                color: theme.colorScheme.onPrimary,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
