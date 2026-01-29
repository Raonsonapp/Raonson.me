import 'package:flutter/material.dart';
import 'auth_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final username = TextEditingController();
    final email = TextEditingController();
    final password = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Sign up')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            AuthTextField(
              hint: 'Username',
              controller: username,
            ),
            const SizedBox(height: 12),
            AuthTextField(
              hint: 'Email',
              controller: email,
            ),
            const SizedBox(height: 12),
            AuthTextField(
              hint: 'Password',
              controller: password,
              obscure: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: register logic
                },
                child: const Text('Sign up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
