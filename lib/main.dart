import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';
import 'navigation/bottom_nav.dart';

void main() {
  runApp(const RaonsonApp());
}

class RaonsonApp extends StatelessWidget {
  const RaonsonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raonson',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0F1A),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
