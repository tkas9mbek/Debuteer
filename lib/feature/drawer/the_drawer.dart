import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/theme/font.dart';
import '../../core/localization/language_data_provider.dart';
import '../../core/routing/route_data_providers.dart';
import '../../core/widget/icon_button_filled.dart';
import 'drawer_tile.dart';
import 'select_lang_window.dart';

class TheDrawer extends ConsumerWidget {
  const TheDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final routes = ref.watch(drawerRoutesProvider);
    final languages = ref.watch(languageDataProvider);

    return Drawer(
      backgroundColor: colorScheme.primary,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButtonFilled(icon: Icons.clear, onTap: () => Navigator.pop(context)),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ...routes
                .map(
                  (e) => DrawerTile(
                    onTap: () => context.push(e.route),
                    child: Text(
                      e.name,
                      style: MyFont.drawer(context),
                    ),
                  ),
                )
                .toList(),
            DrawerTile(
              onTap: () => showDialog<AlertDialog>(
                context: context,
                builder: (BuildContext context) => const SelectLangWindow(),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'language'.tr(),
                    style: MyFont.drawer(context),
                  ),
                  Text(
                    languages.firstWhere((element) => element.locale == context.locale).flag,
                    style: MyFont.style(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
