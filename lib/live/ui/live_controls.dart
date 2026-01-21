import 'package:flutter/material.dart';

class LiveControls extends StatelessWidget {
  final VoidCallback onEnd;

  const LiveControls({required this.onEnd, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      right: 20,
      child: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: onEnd,
        child: const Icon(Icons.stop),
      ),
    );
  }
}