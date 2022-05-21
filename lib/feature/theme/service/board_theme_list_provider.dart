import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/localization/locale_change_provider.dart';
import '../../../core/theme/colors.dart';
import '../model/board_theme.dart';

final boardThemeListProvider = Provider<List<BoardTheme>>(
  (ref) {
    ref.watch(localeChangeProvider);

    return [
    BoardTheme(
      theme: BoardColor.darkBrown,
      color: MyColors.darkBrown,
      name: 'dark_brown'.tr(),
    ),
    BoardTheme(
      theme: BoardColor.brown,
      color: MyColors.brown,
      name: 'brown'.tr(),
    ),
    BoardTheme(
      theme: BoardColor.orange,
      color: MyColors.orange,
      name: 'orange'.tr(),
    ),
    BoardTheme(
      theme: BoardColor.green,
      color: MyColors.blue,
      name: 'blue'.tr(),
    ),
  ];
  },
);
