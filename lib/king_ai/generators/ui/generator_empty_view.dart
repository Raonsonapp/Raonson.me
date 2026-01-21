import 'package:flutter/material.dart';

class GeneratorEmptyView extends StatelessWidget {
  const GeneratorEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Ҳоло ягон генератсия нест.\nPrompt илова кунед.',
        textAlign: TextAlign.center,
      ),
    );
  }
}