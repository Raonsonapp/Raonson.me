import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'widgets/bottom_nav.dart';

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
      theme: AppTheme.darkBlueTheme,
      home: const BottomNav(),
    );
  }
}
