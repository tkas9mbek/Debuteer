import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/theme/font.dart';
import '../../core/theme/styles.dart';
import '../../core/widget/icon_button_filled.dart';
import '../../core/widget/page_foundation.dart';
import '../../core/widget/text_button_filled.dart';
import '../../core/widget/transparent_app_bar.dart';
import '../opening/database.dart';
import 'service/board_provider.dart';
import 'service/orietation_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ChessBoardController _controller = ChessBoardController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {});
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final board = ref.watch(boardProvider);
    final orientation = ref.watch(orientationProvider);

    return PageFoundation(
      hasDrawer: true,
      backgroundColor: colorScheme.primary,
      appBar: TransparentAppBar(
        title: 'title'.tr(),
        leadingType: TransparentLeadingType.drawer,
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: ChessBoard(
              controller: _controller,
              boardColor: board,
              boardOrientation: orientation,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: Styles.generalBodyPadding,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShadowButton(
                      text: 'rotate_board'.tr(),
                      onTap: () => ref.read(orientationProvider.notifier).swap(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButtonFilled(
                          onTap: () {
                            setState(() => _controller.game.undo_move());
                          },
                          icon: FontAwesomeIcons.chevronLeft,
                        ),
                        const SizedBox(
                          width: 12.5,
                        ),
                        IconButtonFilled(
                          onTap: _controller.resetBoard,
                          icon: FontAwesomeIcons.backward,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                ValueListenableBuilder<Chess>(
                  valueListenable: _controller,
                  builder: (context, game, _) {
                    final san = _controller.getSan();
                    final opening = Database().search(san);

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: Styles.cardGeneralRadius,
                            color: colorScheme.primaryContainer,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 15,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  opening?.name ?? 'undefined_opening'.tr(),
                                  textAlign: TextAlign.center,
                                  style: MyFont.style(
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Wrap(
                          children: san
                              .map(
                                (e) => Container(
                                  margin: const EdgeInsets.only(
                                    right: 10,
                                    bottom: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: Styles.cardGeneralRadius,
                                    color: colorScheme.primaryContainer,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 7,
                                    horizontal: 13,
                                  ),
                                  child: Text(
                                    e ?? '',
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        if (opening != null)
                          InkWell(
                            borderRadius: BorderRadius.circular(7.5),
                            onTap: () {
                              final params = Uri(
                                scheme: 'https',
                                host: 'www.google.com',
                                path: '/search',
                                queryParameters: <String, dynamic>{
                                  'q': opening.name,
                                },
                              );

                              launchUrl(params);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(3),
                              child: Text(
                                '${'learn_more_about'.tr()} ${opening.name}',
                                style: MyFont.style(
                                  color: colorScheme.onPrimary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
