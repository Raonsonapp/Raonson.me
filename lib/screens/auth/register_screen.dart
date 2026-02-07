import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _user = TextEditingController();
  final _pass = TextEditingController();
  bool loading = false;
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(backgroundColor: const Color(0xFF0B0F1A)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _input(_user, 'Username'),
            const SizedBox(height: 16),
            _input(_pass, 'Password', obscure: true),

            if (error != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(error!, style: const TextStyle(color: Colors.red)),
              ),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: loading ? null : _register,
                child: loading
                    ? const CircularProgressIndicator()
                    : const Text('Register'),
              ),
            ),
          ],
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

  Future<void> _register() async {
    setState(() {
      loading = true;
      error = null;
    });

    try {
      await AuthService.register(_user.text, _pass.text);
      if (!mounted) return;
      Navigator.pop(context);
    } catch (e) {
      setState(() => error = 'Register failed');
    }

    setState(() => loading = false);
  }
}
