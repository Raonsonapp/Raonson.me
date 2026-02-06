import 'package:flutter/material.dart';
import '../screens/auth/login_screen.dart';
import 'bottom_nav.dart';

class AppRouter extends StatefulWidget {
  const AppRouter({super.key});

  @override
  State<AppRouter> createState() => _AppRouterState();
}

class _AppRouterState extends State<AppRouter> {
  bool isLoggedIn = false; // v2: баъд аз server

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      return const BottomNav();
    } else {
      return LoginScreen(
        onLoginSuccess: () {
          setState(() {
            isLoggedIn = true;
          });
        },
      );
    }
  }
}
