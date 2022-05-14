import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/filter_option.dart';
import '../model/opening.dart';
import 'database_provider.dart';

final filteredListProvider = StateNotifierProvider<FilteredListNotifier, List<Opening>>((ref) {
  final database = ref.watch(databaseProvider);

  return FilteredListNotifier(database);
});

class FilteredListNotifier extends StateNotifier<List<Opening>> {
  FilteredListNotifier(this.database) : super(database);

  final List<Opening> database;

  void filter(FilterOption option) {
    state = database
        .where((element) => element.name.contains(option.name) && element.pgn.contains(option.pgn))
        .toList();
  }

  void reset() {
    state = database;
  }
}
