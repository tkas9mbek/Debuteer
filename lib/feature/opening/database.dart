import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'opening.dart';

class Database {
  static final Database _instance = Database._internal();

  factory Database() => _instance;

  Database._internal();

  List<Opening> openings = [];

  Opening? search(List<String?> san) {
    var pgn = '';

    for(final element in san) {
      pgn += '$element ';
    }

    pgn = pgn.trim();

    print(pgn);

    return openings.firstWhereOrNull(
      (Opening element) => element.pgn == pgn,
    );
  }

  Future<void> init() async {
    final data = await rootBundle.loadString('assets/database/json_data.json');
    final jsonResult = jsonDecode(data) as List;

    for (final element in jsonResult) {
      openings.add(Opening.fromMap(element as Map<String, dynamic>));
    }

    print(openings.length);
  }
}
