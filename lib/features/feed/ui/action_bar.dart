import 'package:flutter/material.dart';

class ActionBar extends StatelessWidget {
  final bool isLiked;

  const ActionBar({super.key, required this.isLiked});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            isLiked ? Icons.favorite : Icons.favorite_border,
            color: isLiked ? Colors.red : Colors.black,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.chat_bubble_outline),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.send),
          onPressed: () {},
        ),
      ],
    );
  }
}
