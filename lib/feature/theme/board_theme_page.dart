import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/theme/styles.dart';
import '../../core/widget/page_foundation.dart';
import '../../core/widget/transparent_app_bar.dart';
import 'service/board_theme_list_provider.dart';
import 'service/board_theme_provider.dart';
import 'widget/board_theme_container.dart';

class BoardThemePage extends ConsumerStatefulWidget {
  const BoardThemePage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<BoardThemePage> {
  final ChessBoardController _controller = ChessBoardController();

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final board = ref.watch(boardThemeProvider);
    final options = ref.watch(boardThemeListProvider);

    return PageFoundation(
      backgroundColor: colorScheme.primary,
      appBar: TransparentAppBar(
        title: 'board_theme'.tr(),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ChessBoard(
                controller: _controller,
                enableUserMoves: false,
                boardColor: board,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: Styles.generalBodyPadding,
              child: Column(
                children: [
                  ...options.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: BoardThemeContainer(
                        theme: e,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
