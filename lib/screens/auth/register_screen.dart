import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: const [
            TextField(decoration: InputDecoration(labelText: 'Username')),
            SizedBox(height: 16),
            TextField(decoration: InputDecoration(labelText: 'Password')),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
