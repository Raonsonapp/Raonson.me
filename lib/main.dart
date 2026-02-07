import 'package:flutter/material.dart';
import 'core/session.dart';
import 'navigation/bottom_nav.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Bootstrap(),
    );
  }
}

class Bootstrap extends StatefulWidget {
  const Bootstrap({super.key});

  @override
  State<Bootstrap> createState() => _BootstrapState();
}

class _BootstrapState extends State<Bootstrap> {
  @override
  void initState() {
    super.initState();
    _go();
  }

  Future<void> _go() async {
    final u = await Session.username();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => u == null ? const LoginScreen() : const BottomNav(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
