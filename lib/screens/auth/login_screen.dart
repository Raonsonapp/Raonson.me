import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import '../../navigation/bottom_nav.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final username = TextEditingController();
  final password = TextEditingController();
  bool loading = false;
  String? error;

  Future<void> doLogin() async {
    setState(() {
      loading = true;
      error = null;
    });

    final ok = await AuthService.login(
      username.text.trim(),
      password.text.trim(),
    );

    setState(() => loading = false);

    if (!mounted) return;

    if (ok) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const BottomNav()),
      );
    } else {
      setState(() => error = 'Login failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Raonson',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              const SizedBox(height: 40),

              TextField(
                controller: username,
                decoration: const InputDecoration(
                  hintText: 'Username',
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),

              const SizedBox(height: 20),
              if (error != null)
                Text(error!, style: const TextStyle(color: Colors.red)),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: loading ? null : doLogin,
                  child: loading
                      ? const CircularProgressIndicator()
                      : const Text('Log in'),
                ),
              ),

              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RegisterScreen(),
                    ),
                  );
                },
                child: const Text('Create new account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
