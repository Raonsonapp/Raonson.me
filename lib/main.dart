import 'package:flutter/material.dart';
import 'screens/auth/login_screen.dart';
import 'navigation/bottom_nav.dart';
import 'core/auth_state.dart';

void main() {
  runApp(const RaonsonApp());
}

class RaonsonApp extends StatelessWidget {
  const RaonsonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthState.isLoggedIn
          ? const BottomNav()
          : const LoginScreen(),
    );
  }
}
