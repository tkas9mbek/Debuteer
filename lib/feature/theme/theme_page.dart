import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/theme/styles.dart';
import '../../core/widget/page_foundation.dart';
import '../../core/widget/transparent_app_bar.dart';
import 'widget/theme_container.dart';

class ThemePage extends ConsumerWidget {
  const ThemePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final schemes = FlexScheme.values.sublist(0, FlexScheme.values.length - 1);

    return PageFoundation(
      backgroundColor: colorScheme.primary,
      appBar: TransparentAppBar(
        title: 'board_theme'.tr(),
      ),
      padding: Styles.generalBodyPadding,
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => ThemeContainer(
          scheme: schemes[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: schemes.length,
      ),
    );
  }
}
