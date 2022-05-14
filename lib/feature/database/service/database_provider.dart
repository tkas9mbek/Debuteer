import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/opening.dart';

final databaseProvider =
    StateNotifierProvider<DatabaseNotifier, List<Opening>>((ref) => DatabaseNotifier());

class DatabaseNotifier extends StateNotifier<List<Opening>> {
  DatabaseNotifier() : super([]);

  Opening? search(String pgn) => state.firstWhereOrNull(
        (Opening element) => element.pgn == pgn,
      );

  Future<void> init() async {
    final openings = <Opening>[];
    final data = await rootBundle.loadString('assets/database/json_data.json');
    final jsonResult = jsonDecode(data) as List;

    for (final element in jsonResult) {
      openings.add(Opening.fromMap(element as Map<String, dynamic>));
    }

    state = openings;
  }
}
