import 'package:flutter/material.dart';
import 'navigation/app_router.dart';

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
        primaryColor: const Color(0xFF4DA3FF),
      ),
      home: const AppRouter(),
    );
  }
}
