import 'package:flutter/cupertino.dart';

enum RouteLocation {
  bottom,
  drawer,
  both,
  home,
  none,
}

class RouteData {
  RouteData({
    required this.name,
    required this.route,
    required this.location,
    this.icon,
  });

  final String name;
  final String route;
  final IconData? icon;
  final RouteLocation location;
}
