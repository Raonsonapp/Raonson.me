import 'package:flutter/material.dart';

class GenerationProgressPage extends StatelessWidget {
  const GenerationProgressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Generating Episode')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text('AI is generating scenes, voices, animation...')
          ],
        ),
      ),
    );
  }
}