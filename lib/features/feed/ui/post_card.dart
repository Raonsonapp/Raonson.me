import 'package:flutter/material.dart';
import 'comment_sheet.dart';

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
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: const Text("raonson_user"),
          trailing: const Icon(Icons.more_vert),
        ),

        // Image
        Container(
          height: 250,
          width: double.infinity,
          color: Colors.black12,
          child: const Icon(Icons.image, size: 80),
        ),

        // Actions
        Row(
          children: [
            IconButton(
              icon: Icon(
                liked ? Icons.favorite : Icons.favorite_border,
                color: liked ? Colors.red : Colors.black,
              ),
             onPressed: () {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) => const CommentSheet(),
  );
},
            IconButton(
              icon: const Icon(Icons.comment_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.send_outlined),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
          ],
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "120 likes",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            "raonson_user  This is Raonson first post 🚀",
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
