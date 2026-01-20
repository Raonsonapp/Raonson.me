import 'package:flutter/material.dart';
import '../models/feed_item.dart';

class PostCard extends StatelessWidget {
  final FeedItem item;
  final VoidCallback onLike;

  const PostCard({
    super.key,
    required this.item,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(item.author),
          Text(item.caption),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite),
                onPressed: onLike,
              ),
              Text('${item.likes}'),
            ],
          )
        ],
      ),
    );
  }
}