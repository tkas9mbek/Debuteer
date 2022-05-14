import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../feature/home/home_page.dart';
import '../../feature/loading_page.dart';
import '../../feature/theme/board_theme_page.dart';
import '../../feature/theme/theme_page.dart';
import 'route_paths.dart';
import 'router_helper_functions.dart';

final routerProvider = Provider<GoRouter>(
  (ref) => GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: routeToLoading,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            buildPageTransition(context, state, page: const LoadingPage()),
      ),
      GoRoute(
        path: routeToHome,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            buildPageTransition(context, state, page: const HomePage()),
      ),
      GoRoute(
        path: routeToBoardTheme,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            buildPageTransition(context, state, page: const BoardThemePage()),
      ),
      GoRoute(
        path: routeToTheme,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            buildPageTransition(context, state, page: const ThemePage()),
      ),
    ],
  ),
);
