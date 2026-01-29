import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
          ),
          title: const Text(
            'username',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.more_vert),
        ),

        // Image
        GestureDetector(
          onDoubleTap: () => setState(() => liked = true),
          child: Image.network(
            'https://picsum.photos/500/500',
            fit: BoxFit.cover,
          ),
        ),

        // Actions
        Row(
          children: [
            IconButton(
              icon: Icon(
                liked ? Icons.favorite : Icons.favorite_border,
                color: liked ? Colors.red : Colors.black,
              ),
              onPressed: () => setState(() => liked = !liked),
            ),
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
          ],
        ),

        // Likes
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '1,234 likes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // Caption
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'username ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: 'This is a demo post caption...'),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),
      ],
    );
  }
}
