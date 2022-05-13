import 'package:flutter_chess_board/flutter_chess_board.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final boardProvider = StateProvider<BoardColor>((ref) => BoardColor.green);
