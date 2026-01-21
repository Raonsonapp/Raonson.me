import 'package:flutter/material.dart';

class PreviewControls extends StatelessWidget {
  final VoidCallback onPlay;
  final VoidCallback onPause;

  const PreviewControls({
    super.key,
    required this.onPlay,
    required this.onPause,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.play_arrow),
          onPressed: onPlay,
        ),
        IconButton(
          icon: const Icon(Icons.pause),
          onPressed: onPause,
        ),
      ],
    );
  }
}