import 'package:flutter/material.dart';

class GeneratorActionBar extends StatelessWidget {
  const GeneratorActionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          _ActionChip(label: "App"),
          _ActionChip(label: "Game"),
          _ActionChip(label: "Backend"),
          _ActionChip(label: "UI"),
        ],
      ),
    );
  }
}

class _ActionChip extends StatelessWidget {
  final String label;

  const _ActionChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      avatar: const Icon(Icons.smart_toy, size: 16),
    );
  }
}
