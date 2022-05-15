import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/theme/font.dart';
import '../../../core/theme/styles.dart';
import '../model/board_theme.dart';
import '../service/board_theme_provider.dart';

class BoardThemeContainer extends ConsumerWidget {
  const BoardThemeContainer({
    required this.theme,
    Key? key,
  }) : super(key: key);

  final BoardTheme theme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = ref.watch(boardThemeProvider);

    return InkWell(
      onTap: () => ref.read(boardThemeProvider.notifier).change(theme.theme),
      borderRadius: Styles.cardGeneralRadius,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: Styles.cardGeneralRadius,
          color: theme.color,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              theme.name.tr(),
              style: MyFont.style(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            if (theme.theme == selected) ...[
              const Icon(
                FontAwesomeIcons.solidCircleCheck,
                color: Colors.white,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
