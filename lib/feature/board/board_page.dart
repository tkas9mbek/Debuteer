import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/routing/route_paths.dart';
import '../../core/service/helper_functions.dart';
import '../../core/theme/styles.dart';
import '../../core/widget/icon_button_filled.dart';
import '../../core/widget/page_foundation.dart';
import '../../core/widget/shadow_text_button.dart';
import '../../core/widget/transparent_app_bar.dart';
import '../database/model/filter_option.dart';
import '../database/service/database_provider.dart';
import '../database/service/filter_option_provider.dart';
import '../database/service/filtered_list_provider.dart';
import '../database/widget/opening_container.dart';
import '../theme/service/board_theme_provider.dart';
import 'service/orientation_provider.dart';
import 'widget/move_container.dart';
import 'widget/text_link.dart';

class BoardPage extends ConsumerStatefulWidget {
  const BoardPage({
    this.pgn = '',
    Key? key,
  }) : super(key: key);

  final String pgn;

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<BoardPage> {
  final ChessBoardController _controller = ChessBoardController();
  final _assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    _controller.loadPGN(widget.pgn);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  void _searchSimilar(String pgn) {
    final options = FilterOption(
      name: '',
      pgn: pgn,
    );

    ref.read(filterOptionProvider.state).state = options;
    ref.read(filteredListProvider.notifier).filter(options);

    context.push(routeToDatabase);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final board = ref.watch(boardThemeProvider);
    final orientation = ref.watch(orientationProvider);

    return PageFoundation(
      hasDrawer: true,
      backgroundColor: colorScheme.primary,
      appBar: TransparentAppBar(
        title: 'title'.tr(),
        leadingType: TransparentLeadingType.drawer,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ChessBoard(
                controller: _controller,
                boardColor: board,
                boardOrientation: orientation,
              ),
            ),
            Padding(
              padding: Styles.generalBodyPadding,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShadowTextButton(
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
                      final pgn = sanToPgn(san);
                      final opening = ref.read(databaseProvider.notifier).search(pgn);

                      _assetsAudioPlayer.open(
                        Audio('assets/sounds/move.wav'),
                      );

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OpeningContainer(
                            name: opening?.name ?? 'undefined_opening'.tr(),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          MoveContainer(
                            san: san,
                          ),
                          if (opening != null) ...[
                            TextLink(
                              onClick: () {
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
                              text: '${'learn_more_about'.tr()} ${opening.name}',
                            ),
                          ],
                          if (pgn.isNotEmpty)
                            TextLink(
                              onClick: () => _searchSimilar(pgn),
                              text: 'search_similar_openings'.tr(),
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
      ),
    );
  }
}
