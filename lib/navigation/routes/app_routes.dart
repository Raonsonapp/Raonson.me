import 'package:flutter/material.dart';
import '../../auth/auth.dart';
import '../guards/auth_route_guard.dart';
import 'route_names.dart';

class AppRoutes {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return _page(const _SplashPage());

      case RouteNames.login:
        return _page(const LoginScreen());

      case RouteNames.register:
        return _page(const RegisterScreen());

      case RouteNames.home:
        if (!AuthRouteGuard.canAccess()) {
          return _page(const LoginScreen());
        }
        return _page(const _HomePage());

      default:
        return _page(const _NotFoundPage());
    }
  }

  static MaterialPageRoute _page(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}
