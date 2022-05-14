import 'package:flutter/foundation.dart';

@immutable
class FilterOption {
  const FilterOption({
    this.name = '',
    this.pgn = '',
  });

  final String name;
  final String pgn;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FilterOption &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          pgn == other.pgn);

  @override
  int get hashCode => name.hashCode ^ pgn.hashCode;

  @override
  String toString() => 'FilterOption{ name: $name, pgn: $pgn,}';

  FilterOption copyWith({
    String? name,
    String? pgn,
  }) =>
      FilterOption(
        name: name ?? this.name,
        pgn: pgn ?? this.pgn,
      );
}
