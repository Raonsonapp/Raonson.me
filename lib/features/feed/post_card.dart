import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: const CircleAvatar(),
          title: const Text('Username'),
          trailing: const Icon(Icons.more_vert),
        ),
        Container(
          height: 250,
          color: Colors.grey.shade300,
        ),
        Row(
          children: const [
            Icon(Icons.favorite_border),
            SizedBox(width: 12),
            Icon(Icons.comment_outlined),
            SizedBox(width: 12),
            Icon(Icons.send),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(8),
          child: Text('Liked by user1 and 120 others'),
        ),
      ],
    );
  }
}
