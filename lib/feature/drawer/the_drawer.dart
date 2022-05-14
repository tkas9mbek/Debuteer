import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/theme/font.dart';
import '../../core/routing/route_data_providers.dart';
import '../../core/routing/route_paths.dart';
import '../../core/widget/icon_button_filled.dart';
import '../theme/service/board_theme_list_provider.dart';
import '../theme/service/board_theme_provider.dart';
import 'drawer_tile.dart';

class TheDrawer extends ConsumerWidget {
  const TheDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme
        .of(context)
        .colorScheme;
    final routes = ref.watch(drawerRoutesProvider);
    final board = ref.watch(boardThemeProvider);
    final options = ref.watch(boardThemeListProvider);

    return Drawer(
      backgroundColor: colorScheme.primary,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButtonFilled(icon: Icons.clear, onTap: () => Navigator.pop(context)),
                const SizedBox(
                  width: 15,
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            ...routes
                .map(
                  (e) =>
                  DrawerTile(
                    onTap: () => context.push(e.route),
                    child: Text(
                      e.name,
                      style: MyFont.drawer(context),
                    ),
                  ),
            )
                .toList(),
            DrawerTile(
              onTap: () => context.push(routeToBoardTheme),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'board_theme'.tr(),
                    style: MyFont.drawer(context),
                  ),
                  Container(
                    height: 18,
                    width: 25,
                    color: options
                        .firstWhere((element) => element.theme == board)
                        .color,
                  ),
                ],
              ),
            ),
            DrawerTile(
              onTap: () => context.push(routeToLanguage),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'language'.tr(),
                    style: MyFont.drawer(context),
                  ),
                  const Text('🇷🇺'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
