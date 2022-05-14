import 'package:easy_localization/easy_localization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
  (ref) => [
    RouteData(
      name: 'database'.tr(),
      route: routeToDatabase,
      location: RouteLocation.drawer,
      icon: FontAwesomeIcons.palette,
    ),
    // RouteData(
    //   name: 'about'.tr(),
    //   route: routeToAbout,
    //   location: RouteLocation.drawer,
    //   icon: FontAwesomeIcons.palette,
    // ),
    RouteData(
      name: 'theme'.tr(),
      route: routeToTheme,
      location: RouteLocation.drawer,
      icon: FontAwesomeIcons.clock,
    ),
    RouteData(
      name: 'board_theme'.tr(),
      route: routeToBoardTheme,
      location: RouteLocation.drawer,
      icon: FontAwesomeIcons.addressCard,
    ),
  ],
);
