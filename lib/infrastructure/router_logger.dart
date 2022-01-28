import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RouterLogger extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    _log('New route pushed: ${route.settings.name} ');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _log('Route popped: ${route.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    _log('Removed route: ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    _log(
        'Replaced route ${oldRoute?.settings.name} with ${newRoute?.settings.name}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    _log('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    _log('Tab route re-visited: ${route.name}');
  }

  void _log(String text) {
    if (kDebugMode) {
      debugPrint(text);
    }
  }
}
