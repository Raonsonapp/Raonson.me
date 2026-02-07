import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool loading = false;
  String error = '';
  String success = '';

  Future<void> register() async {
    setState(() {
      loading = true;
      error = '';
      success = '';
    });

    final response = await http.post(
      Uri.parse('https://raonson-me.onrender.com/auth/register'),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        'username': _usernameController.text.trim(),
        'password': _passwordController.text.trim(),
      }),
    );

    setState(() => loading = false);

    if (response.statusCode == 200) {
      setState(() {
        success = 'Registered successfully';
      });
    } else {
      setState(() {
        error = 'Registration failed';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white30),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: _passwordController,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white30),
                ),
              ),
            ),

            const SizedBox(height: 30),

            if (error.isNotEmpty)
              Text(error, style: const TextStyle(color: Colors.red)),

            if (success.isNotEmpty)
              Text(success, style: const TextStyle(color: Colors.green)),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: loading ? null : register,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 14,
                ),
              ),
              child: loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
