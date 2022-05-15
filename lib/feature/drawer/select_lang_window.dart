import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/localization/language_data_provider.dart';
import '../../core/theme/font.dart';
import '../../core/widget/icon_button_filled.dart';

class SelectLangWindow extends ConsumerWidget {
  const SelectLangWindow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final languages = ref.watch(languageDataProvider);

    return AlertDialog(
      backgroundColor: colorScheme.primaryContainer,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'select_lang'.tr(),
                style: MyFont.style(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onPrimaryContainer,
                ),
              ),
              IconButtonFilled(
                size: 30,
                radius: 8,
                onTap: () => Navigator.pop(context),
                icon: Icons.clear,
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          ...languages
              .map(
                (e) => InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                  onTap: () {
                    context.setLocale(e.locale);
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 18,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          e.name,
                          style: MyFont.style(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.onPrimaryContainer,                          ),
                        ),
                        Text(
                          e.flag,
                          style: MyFont.style(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
              .toList(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
