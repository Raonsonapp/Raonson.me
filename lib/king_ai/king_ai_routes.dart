import 'package:flutter/material.dart';
import 'ui/king_ai_screen.dart';

class KingAIRoutes {
  static const String kingAI = '/king-ai';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case kingAI:
        return MaterialPageRoute(
          builder: (_) => const KingAIScreen(),
        );
    }
    return null;
  }
}