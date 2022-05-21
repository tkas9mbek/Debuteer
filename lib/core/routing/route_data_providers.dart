import 'package:easy_localization/easy_localization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../localization/locale_change_provider.dart';
import 'route_data.dart';
import 'route_paths.dart';

final drawerRoutesProvider = Provider<List<RouteData>>((ref) {
  final routeData = ref.watch(routeDataProvider);

  return routeData
      .where(
        (e) => e.location == RouteLocation.drawer || e.location == RouteLocation.both,
      )
      .toList();
});

final routeDataProvider = Provider<List<RouteData>>(
  (ref) {
    ref.watch(localeChangeProvider);

    return [
      RouteData(
        name: 'database'.tr(),
        route: routeToDatabase,
        location: RouteLocation.drawer,
      ),
      RouteData(
        name: 'theme'.tr(),
        route: routeToTheme,
        location: RouteLocation.drawer,
      ),
      RouteData(
        name: 'board_theme'.tr(),
        route: routeToBoardTheme,
        location: RouteLocation.drawer,
      ),
    ];
  },
);
