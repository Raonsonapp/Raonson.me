import 'package:flutter/material.dart';

// Screens
import 'screens/home_screen.dart';
import 'screens/chatgpt_screen.dart';
import 'screens/king_ai_screen.dart';
import 'screens/nexttoon_screen.dart';

void main() {
  runApp(const RaonsonApp());
}

class RaonsonApp extends StatelessWidget {
  const RaonsonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Raonson',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),

      // 🔥 Экран аввал
      initialRoute: '/',

      // 🔥 Роутҳо
      routes: {
        '/': (context) => const HomeScreen(),
        '/chatgpt': (context) => const ChatGPTScreen(),
        '/king-ai': (context) => const KingAIScreen(),
        '/nexttoon': (context) => const NextToonScreen(),
      },
    );
  }
}
