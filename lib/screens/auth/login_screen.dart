import 'package:flutter/material.dart';
import '../../services/auth_service.dart';
import 'register_screen.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _user = TextEditingController();
  final _pass = TextEditingController();
  bool loading = false;
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Raonson',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              _input(_user, 'Username'),
              const SizedBox(height: 16),
              _input(_pass, 'Password', obscure: true),

              if (error != null) ...[
                const SizedBox(height: 12),
                Text(error!, style: const TextStyle(color: Colors.red)),
              ],

              const SizedBox(height: 24),
              _loginButton(),

              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const RegisterScreen(),
                    ),
                  );
                },
                child: const Text('Create account'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _input(
    TextEditingController c,
    String hint, {
    bool obscure = false,
  }) {
    return TextField(
      controller: c,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _loginButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: loading ? null : _login,
        child: loading
            ? const CircularProgressIndicator()
            : const Text('Login'),
      ),
    );
  }

  Future<void> _login() async {
    setState(() {
      loading = true;
      error = null;
    });

    try {
      await AuthService.login(_user.text, _pass.text);
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (_) => false,
      );
    } catch (e) {
      setState(() => error = 'Invalid credentials');
    }

    setState(() => loading = false);
  }
}
