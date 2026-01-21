import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic>? push(String route) {
    return navigatorKey.currentState?.pushNamed(route);
  }

  static Future<dynamic>? replace(String route) {
    return navigatorKey.currentState
        ?.pushReplacementNamed(route);
  }

  static void pop() {
    navigatorKey.currentState?.pop();
  }
}