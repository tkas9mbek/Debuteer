import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage<void> buildPageTransition(
  BuildContext context,
  GoRouterState state, {
  required Widget page,
}) =>
    CustomTransitionPage<void>(
      key: state.pageKey,
      child: page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
