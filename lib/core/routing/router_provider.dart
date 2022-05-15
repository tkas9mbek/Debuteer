import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../feature/board/board_page.dart';
import '../../feature/database/database_page.dart';
import '../../feature/database/filter_database_page.dart';
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
        pageBuilder: (BuildContext context, GoRouterState state) {
          final pgn = state.extra as String?;

          return buildPageTransition(
            context,
            state,
            page: BoardPage(
              pgn: pgn ?? '',
            ),
          );
        },
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
      GoRoute(
        path: routeToDatabase,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            buildPageTransition(context, state, page: const DatabasePage()),
      ),
      GoRoute(
        path: routeToFilter,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            buildPageTransition(context, state, page: const FilterDatabasePage()),
      ),
    ],
  ),
);
