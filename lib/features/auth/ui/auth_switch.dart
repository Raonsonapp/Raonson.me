import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'register_screen.dart';

class AuthSwitch extends StatefulWidget {
  const AuthSwitch({super.key});

  @override
  State<AuthSwitch> createState() => _AuthSwitchState();
}

class _AuthSwitchState extends State<AuthSwitch> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      child: isLogin
          ? LoginScreen(onSwitch: () => setState(() => isLogin = false))
          : RegisterScreen(onSwitch: () => setState(() => isLogin = true)),
    );
  }
}
