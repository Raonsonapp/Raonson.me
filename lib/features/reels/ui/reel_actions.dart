import 'package:flutter/material.dart';
import '../data/reel_model.dart';

class ReelActions extends StatelessWidget {
  final ReelModel reel;
  final VoidCallback onLike;

  const ReelActions({
    super.key,
    required this.reel,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          iconSize: 32,
          onPressed: onLike,
          icon: Icon(
            reel.isLiked ? Icons.favorite : Icons.favorite_border,
            color: reel.isLiked ? Colors.red : Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        IconButton(
          iconSize: 32,
          onPressed: () {},
          icon: const Icon(Icons.comment, color: Colors.white),
        ),
        const SizedBox(height: 16),
        IconButton(
          iconSize: 32,
          onPressed: () {},
          icon: const Icon(Icons.send, color: Colors.white),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
