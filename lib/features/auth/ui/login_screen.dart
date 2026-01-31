import 'package:flutter/material.dart';
import '../logic/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final pass = TextEditingController();
  final controller = AuthController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Raonson Login", style: TextStyle(fontSize: 22)),
            TextField(controller: email, decoration: const InputDecoration(labelText: "Email")),
            TextField(controller: pass, decoration: const InputDecoration(labelText: "Password")),
            ElevatedButton(
              onPressed: () async {
                await controller.login(email.text, pass.text);
                if (controller.state.success) {
                  Navigator.pushReplacementNamed(context, "/home");
                }
              },
              child: const Text("Login"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/register");
              },
              child: const Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}
