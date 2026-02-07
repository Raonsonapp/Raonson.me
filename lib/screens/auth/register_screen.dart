import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool loading = false;
  String? error;

  Future<void> register() async {
    setState(() {
      loading = true;
      error = null;
    });

    try {
      await AuthService.register(
        username: _username.text.trim(),
        password: _password.text.trim(),
      );

      if (!mounted) return;
      Navigator.pop(context); // баргашт ба login
    } catch (e) {
      setState(() => error = e.toString());
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _username,
              style: const TextStyle(color: Colors.white),
              decoration: _dec('Username'),
            ),
            const SizedBox(height: 16),

            TextField(
              controller: _password,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: _dec('Password'),
            ),

            if (error != null) ...[
              const SizedBox(height: 12),
              Text(error!, style: const TextStyle(color: Colors.red)),
            ],

            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: loading ? null : register,
              child: loading
                  ? const CircularProgressIndicator()
                  : const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _dec(String label) => InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
        ),
      );
}
