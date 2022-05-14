import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/filter_option.dart';

final filterOptionProvider = StateProvider<FilterOption>((ref) => const FilterOption());
