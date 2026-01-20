import 'package:flutter/material.dart';

// Screens
import '../king_ai/ui/king_ai_screen.dart';
// баъдтар: import '../next_toon/ui/...';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String kingAI = '/king-ai';
}

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const _SplashScreen(),
        );

      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const _HomeScreen(),
        );

      case AppRoutes.kingAI:
        return MaterialPageRoute(
          builder: (_) => const KingAIScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const _NotFoundScreen(),
        );
    }
  }
}

/* ===== Temporary base screens ===== */

class _SplashScreen extends StatelessWidget {
  const _SplashScreen();

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

class _HomeScreen extends StatelessWidget {
  const _HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Raonson')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.kingAI);
          },
          child: const Text('Open KING AI'),
        ),
      ),
    );
  }
}

class _NotFoundScreen extends StatelessWidget {
  const _NotFoundScreen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('404 – Page not found')),
    );
  }
}