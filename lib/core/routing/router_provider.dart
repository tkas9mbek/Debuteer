import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../feature/home/home_page.dart';
import 'route_paths.dart';

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: routeToHome,
        builder: (BuildContext context, GoRouterState state) => const HomePage(),
      ),
    ],
  ),
);
