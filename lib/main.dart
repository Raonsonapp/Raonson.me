import 'package:flutter/material.dart';
import 'core/session.dart';
import 'screens/auth/login_screen.dart';
import 'widgets/bottom_nav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final logged = await Session.isLoggedIn();
  runApp(MyApp(startHome: logged));
}

class MyApp extends StatelessWidget {
  final bool startHome;
  const MyApp({super.key, required this.startHome});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0F1A),
      ),
      home: startHome ? const BottomNav() : const LoginScreen(),
    );
  }
}
