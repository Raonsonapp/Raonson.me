import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'navigation/bottom_nav.dart';
import 'auth/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0F1A),
        useMaterial3: true,
      ),
      home: const Root(),
    );
  }
}

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  bool? loggedIn;

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    setState(() {
      loggedIn = username != null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loggedIn == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return loggedIn!
        ? const BottomNav()
        : const LoginScreen();
  }
}
