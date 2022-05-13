import 'package:easy_localization/easy_localization.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/widget/page_foundation.dart';
import '../../core/widget/transparent_app_bar.dart';
import 'theme_container.dart';

class ChangeThemePage extends ConsumerWidget {
  const ChangeThemePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const schemes = FlexScheme.values;

    return PageFoundation(
      appBar: TransparentAppBar(
        title: 'change_theme'.tr(),
      ),
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
