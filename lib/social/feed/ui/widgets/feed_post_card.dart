import 'package:flutter/material.dart';
import '../../core/feed_post.dart';

class FeedPostCard extends StatelessWidget {
  final FeedPost post;
  final VoidCallback onLike;

  const FeedPostCard({
    super.key,
    required this.post,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(post.content),
            const SizedBox(height: 12),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    post.liked ? Icons.favorite : Icons.favorite_border,
                    color: post.liked ? Colors.red : null,
                  ),
                  onPressed: onLike,
                ),
                Text(post.likes.toString()),
                const SizedBox(width: 16),
                const Icon(Icons.comment, size: 20),
                const SizedBox(width: 4),
                Text(post.comments.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
