import 'package:flutter/material.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart' as chess;

@immutable
class BoardTheme {
  const BoardTheme({
    required this.theme,
    required this.color,
    required this.name,
  });

  final chess.BoardColor theme;
  final Color color;
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BoardTheme &&
          runtimeType == other.runtimeType &&
          theme == other.theme &&
          color == other.color &&
          name == other.name);

  @override
  int get hashCode => theme.hashCode ^ color.hashCode ^ name.hashCode;

  @override
  String toString() => 'BoardTheme{ theme: $theme, color: $color, name: $name,}';

  BoardTheme copyWith({
    chess.BoardColor? theme,
    Color? color,
    String? name,
  }) =>
      BoardTheme(
        theme: theme ?? this.theme,
        color: color ?? this.color,
        name: name ?? this.name,
      );
}
