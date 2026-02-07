import 'package:flutter/material.dart';
import 'core/session.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      home: const Root(),
    );
  }
}

/// Root = муайян мекунад:
/// - агар session ҳаст → Home
/// - агар нест → Login
class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  bool? _loggedIn;

  @override
  void initState() {
    super.initState();
    _checkSession();
  }

  Future<void> _checkSession() async {
    final ok = await Session.isLoggedIn();
    setState(() => _loggedIn = ok);
  }

  @override
  Widget build(BuildContext context) {
    if (_loggedIn == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // ⚠️ Ҳоло screen-ҳо ҳанӯз нестанд
    // ҚАДАМ 3-4 меорем
    return _loggedIn!
        ? const _HomePlaceholder()
        : const _LoginPlaceholder();
  }
}

/// placeholders муваққатӣ ҳастанд
/// дар қадамҳои баъдӣ иваз мешаванд
class _LoginPlaceholder extends StatelessWidget {
  const _LoginPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'LOGIN SCREEN (қадам 3)',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

class _HomePlaceholder extends StatelessWidget {
  const _HomePlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'HOME SCREEN (қадам 4)',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
