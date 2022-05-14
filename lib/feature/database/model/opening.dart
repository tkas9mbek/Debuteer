import 'package:flutter/cupertino.dart';

@immutable
class Opening {
  const Opening({
    required this.name,
    required this.eco,
    required this.pgn,
    required this.uci,
    required this.epd,
  });

  factory Opening.fromMap(Map<String, dynamic> map) => Opening(
        name: map['name'] as String,
        eco: map['eco'] as String,
        pgn: map['pgn'] as String,
        uci: map['uci'] as String,
        epd: map['epd'] as String,
      );

  final String name;
  final String eco;
  final String pgn;
  final String uci;
  final String epd;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Opening &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          eco == other.eco &&
          pgn == other.pgn &&
          epd == other.epd &&
          uci == other.uci);

  @override
  int get hashCode => name.hashCode ^ eco.hashCode ^ pgn.hashCode ^ uci.hashCode ^ epd.hashCode;

  @override
  String toString() => 'Opening{ name: $name, eco: $eco, pgn: $pgn, uci: $uci, epd: $epd,}';

  Opening copyWith({
    String? name,
    String? eco,
    String? pgn,
    String? uci,
    String? epd,
  }) =>
      Opening(
        name: name ?? this.name,
        eco: eco ?? this.eco,
        pgn: pgn ?? this.pgn,
        uci: uci ?? this.uci,
        epd: epd ?? this.epd,
      );
}
