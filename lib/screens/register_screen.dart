import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  bool loading = false;
  String? message;

  Future<void> register() async {
    setState(() {
      loading = true;
      message = null;
    });

    try {
      await AuthService.register(
        usernameCtrl.text,
        passwordCtrl.text,
      );
      setState(() => message = 'Account created. Go back to login.');
    } catch (_) {
      setState(() => message = 'Register failed');
    } finally {
      setState(() => loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: usernameCtrl,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordCtrl,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            if (message != null)
              Text(
                message!,
                style: TextStyle(
                  color: message!.contains('created')
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            const SizedBox(height: 10),
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
}
