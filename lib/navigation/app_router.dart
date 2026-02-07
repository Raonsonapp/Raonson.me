import 'package:flutter/material.dart';
import '../screens/auth/login_screen.dart';
import 'bottom_nav.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({super.key});

  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
