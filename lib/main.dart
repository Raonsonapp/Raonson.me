import 'package:flutter/material.dart';
import 'core/session.dart';
import 'navigation/bottom_nav.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RaonsonApp());
}

class RaonsonApp extends StatefulWidget {
  const RaonsonApp({super.key});

  @override
  State<RaonsonApp> createState() => _RaonsonAppState();
}

class _RaonsonAppState extends State<RaonsonApp> {
  bool _loading = true;
  bool _loggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    final user = await Session.username();
    setState(() {
      _loggedIn = user != null && user.isNotEmpty;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Raonson',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F1424),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F1424),
          elevation: 0,
        ),
      ),

      // ===== ROUTES =====
      routes: {
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/home': (_) => const BottomNav(),
      },

      // ===== ROOT =====
      home: _loading
          ? const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            )
          : _loggedIn
              ? const BottomNav()
              : const LoginScreen(),
    );
  }
}
