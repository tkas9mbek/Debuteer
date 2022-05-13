import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/theme/font.dart';
import '../../../../core/theme/provider/theme_mode_provider.dart';

class TheDrawer extends ConsumerWidget {
  const TheDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final themeMode = ref.watch(themeModeProvider);
    const padding = 20.0;

    return Drawer(
      backgroundColor: colorScheme.primary,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            ListTile(
              onTap: ref.read(themeModeProvider.notifier).switchTheme,
              title: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: padding,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'dark_mode'.tr(),
                      style: MyFont.drawer(context),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
