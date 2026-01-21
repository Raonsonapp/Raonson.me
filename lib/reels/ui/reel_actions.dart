import 'package:flutter/material.dart';

class ReelActions extends StatelessWidget {
  final int likes;
  final int comments;

  const ReelActions({
    super.key,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          icon: const Icon(Icons.favorite, color: Colors.red),
          onPressed: () {},
        ),
        Text('$likes'),
        const SizedBox(height: 12),
        IconButton(
          icon: const Icon(Icons.comment),
          onPressed: () {},
        ),
        Text('$comments'),
        const SizedBox(height: 12),
        IconButton(
          icon: const Icon(Icons.share),
          onPressed: () {},
        ),
      ],
    );
  }
}
