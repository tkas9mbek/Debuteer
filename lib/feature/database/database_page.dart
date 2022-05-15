import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/routing/route_paths.dart';
import '../../core/service/show_toast.dart';
import '../../core/theme/font.dart';
import '../../core/theme/styles.dart';
import '../../core/value/constants.dart';
import '../../core/widget/icon_button_filled.dart';
import '../../core/widget/page_foundation.dart';
import '../../core/widget/transparent_app_bar.dart';
import 'service/filtered_list_provider.dart';
import 'widget/opening_container.dart';

class DatabasePage extends ConsumerStatefulWidget {
  const DatabasePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _DatabasePageState();
}

class _DatabasePageState extends ConsumerState<DatabasePage> {
  final textCtrl = TextEditingController(text: '1');
  int page = 1;

  bool _updatePage(int next, int max) {
    if (next > 0 && next <= max) {
      textCtrl.text = next.toString();
      setState(() => page = next);

      return true;
    }

    return false;
  }

  @override
  void dispose() {
    textCtrl.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(filteredListProvider, (previous, next) {
      page = 1;
      textCtrl.text = '1';
    });

    final colorScheme = Theme.of(context).colorScheme;
    final list = ref.watch(filteredListProvider);
    final max = (list.length / PER_PAGE).ceil();
    final currentList = list.sublist((page - 1) * PER_PAGE, min(page * PER_PAGE, list.length));

    return PageFoundation(
      hasDrawer: true,
      backgroundColor: colorScheme.primary,
      padding: Styles.generalBodyPadding.copyWith(
        top: 0,
        bottom: 0,
      ),
      appBar: TransparentAppBar(
        title: 'database'.tr(),
        actions: [
          IconButtonFilled(
            icon: FontAwesomeIcons.filter,
            onTap: () => context.push(routeToFilter),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButtonFilled(
                    icon: FontAwesomeIcons.backward,
                    size: 38,
                    onTap: () => _updatePage(1, max),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButtonFilled(
                    size: 38,
                    icon: FontAwesomeIcons.chevronLeft,
                    onTap: () => _updatePage(page - 1, max),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 46,
                    child: TextField(
                      controller: textCtrl,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (value) {
                        final next = int.parse(value);

                        if (!_updatePage(next, max)) {
                          showToast(
                            context,
                            message: 'enter_valid_value'.tr(),
                            positive: false,
                          );
                        }
                      },
                      style: MyFont.style(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: Styles.formInputDecoration(
                        context,
                      ).copyWith(
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 10,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${'of'.tr()} $max',
                    style: MyFont.style(
                      color: colorScheme.onPrimary,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButtonFilled(
                    size: 38,
                    icon: FontAwesomeIcons.chevronRight,
                    onTap: () => _updatePage(page + 1, max),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButtonFilled(
                    size: 38,
                    icon: FontAwesomeIcons.forward,
                    onTap: () => _updatePage(max, max),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                final opening = currentList[index];

                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 15,
                  ),
                  child: OpeningContainer(
                    onTap: () => context.push(routeToHome, extra: opening.pgn),
                    name: opening.name,
                  ),
                );
              },
              itemCount: currentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
