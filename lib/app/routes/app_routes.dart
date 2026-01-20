import 'package:flutter/material.dart';

// Core pages
import '../../auth/ui/login_page.dart';
import '../../home/ui/home_page.dart';

// King AI
import '../../king_ai/ui/king_ai_entry.dart';

class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const home = '/home';

  // KING AI
  static const kingAI = '/king-ai';
}

class AppRouter {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return _page(const _SplashPage());

      case AppRoutes.login:
        return _page(const LoginPage());

      case AppRoutes.home:
        return _page(const HomePage());

      case AppRoutes.kingAI:
        return _page(const KingAIEntryPage());

      default:
        return _page(const _NotFoundPage());
    }
  }

  static MaterialPageRoute _page(Widget child) {
    return MaterialPageRoute(builder: (_) => child);
  }
}

/* ---------------- TEMP ---------------- */

class _SplashPage extends StatelessWidget {
  const _SplashPage();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });

    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}

class _NotFoundPage extends StatelessWidget {
  const _NotFoundPage();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('404')),
    );
  }
}
