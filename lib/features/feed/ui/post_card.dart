import 'package:flutter/material.dart';
import '../data/post_model.dart';
import 'action_bar.dart';

class PostCard extends StatelessWidget {
  final PostModel post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(post.userAvatar),
          ),
          title: Text(
            post.username,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.more_vert),
        ),
        Image.network(
          post.imageUrl,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        ActionBar(isLiked: post.isLiked),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '${post.likes} likes',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: post.username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' ${post.caption}'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
