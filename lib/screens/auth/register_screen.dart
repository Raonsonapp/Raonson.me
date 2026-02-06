import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final u = TextEditingController();
  final p = TextEditingController();
  bool loading = false;

  Future<void> doRegister() async {
    setState(() => loading = true);
    try {
      final ok = await AuthService.register(u.text, p.text);
      if (ok && mounted) Navigator.pop(context);
    } finally {
      if (mounted) setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(backgroundColor: const Color(0xFF0B0F1A), title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(controller: u, decoration: const InputDecoration(labelText: 'Username')),
            const SizedBox(height: 16),
            TextField(controller: p, obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 24),
            loading
                ? const CircularProgressIndicator()
                : ElevatedButton(onPressed: doRegister, child: const Text('Create')),
          ],
        ),
      ),
    );
  }
}
