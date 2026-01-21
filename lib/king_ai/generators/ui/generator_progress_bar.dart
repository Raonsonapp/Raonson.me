import 'package:flutter/material.dart';

class GeneratorProgressBar extends StatelessWidget {
  final double progress;

  const GeneratorProgressBar({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress,
      minHeight: 6,
      backgroundColor: Colors.grey.shade300,
    );
  }
}