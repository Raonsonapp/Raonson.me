import 'package:flutter/material.dart';

import 'screens/auth/login_screen.dart';

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
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0B0F1A),
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
