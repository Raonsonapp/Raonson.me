import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = false;
  bool saved = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // HEADER
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person),
          ),
          title: const Text(
            'raonson_user',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.more_vert),
        ),

        // IMAGE / VIDEO PLACEHOLDER
        GestureDetector(
          onDoubleTap: () {
            setState(() => liked = true);
          },
          child: Container(
            height: 280,
            color: Colors.black12,
            child: const Center(
              child: Icon(Icons.image, size: 80),
            ),
          ),
        ),

        // ACTIONS
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  color: liked ? Colors.red : Colors.black,
                ),
                onPressed: () {
                  setState(() => liked = !liked);
                },
              ),
              IconButton(
                icon: const Icon(Icons.comment_outlined),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {},
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  saved ? Icons.bookmark : Icons.bookmark_border,
                ),
                onPressed: () {
                  setState(() => saved = !saved);
                },
              ),
            ],
          ),
        ),

        // LIKES
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '1,234 likes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // CAPTION
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            'raonson_user  Ин аввалин пости Raonson 🚀',
          ),
        ),

        const SizedBox(height: 12),
      ],
    );
  }
}
