import 'package:flutter/material.dart';

class ReelActions extends StatelessWidget {
  final bool isLiked;
  final int likes;

  const ReelActions({
    super.key,
    required this.isLiked,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          isLiked ? Icons.favorite : Icons.favorite_border,
          color: isLiked ? Colors.red : Colors.white,
          size: 32,
        ),
        Text('$likes', style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 16),
        const Icon(Icons.chat_bubble_outline, color: Colors.white, size: 28),
        const SizedBox(height: 16),
        const Icon(Icons.send, color: Colors.white, size: 28),
        const SizedBox(height: 16),
        const Icon(Icons.more_vert, color: Colors.white),
      ],
    );
  }
}
