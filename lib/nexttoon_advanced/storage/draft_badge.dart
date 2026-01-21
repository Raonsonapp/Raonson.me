import 'package:flutter/material.dart';

class DraftBadge extends StatelessWidget {
  const DraftBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Text(
        "DRAFT",
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
