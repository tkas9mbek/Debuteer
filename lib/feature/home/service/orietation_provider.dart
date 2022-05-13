import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final orientationProvider =
    StateNotifierProvider<OrientationNotifier, PlayerColor>((ref) => OrientationNotifier());

class OrientationNotifier extends StateNotifier<PlayerColor> {
  OrientationNotifier() : super(PlayerColor.white);

  void swap() {
    if (state == PlayerColor.white) {
      state = PlayerColor.black;
    } else {
      state = PlayerColor.white;
    }
  }
}
