import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        title: const Text('Raonson'),
      ),
      body: const Center(
        child: Text(
          'Home feed (v2)',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
