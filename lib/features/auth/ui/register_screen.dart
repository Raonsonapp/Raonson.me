import 'package:flutter/material.dart';
import '../logic/auth_controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final email = TextEditingController();
  final pass = TextEditingController();
  final controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Register"),
            TextField(controller: email),
            TextField(controller: pass),
            ElevatedButton(
              onPressed: () async {
                await controller.register(email.text, pass.text);
                Navigator.pop(context);
              },
              child: const Text("Create Account"),
            )
          ],
        ),
      ),
    );
  }
}
