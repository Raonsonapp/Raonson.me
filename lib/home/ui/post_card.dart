import 'package:flutter/material.dart';
import '../models/post_model.dart';

class PostCard extends StatefulWidget {
  final PostModel post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.post.userAvatar),
          ),
          title: Text(widget.post.username),
          trailing: const Icon(Icons.more_vert),
        ),

        // Image
        GestureDetector(
          onDoubleTap: () {
            setState(() => isLiked = true);
          },
          child: Image.network(
            widget.post.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
          ),
        ),

        // Actions
        Row(
          children: [
            IconButton(
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.black,
              ),
              onPressed: () {
                setState(() => isLiked = !isLiked);
              },
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '${widget.post.likes + (isLiked ? 1 : 0)} likes',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // Caption
        Padding(
          padding: const EdgeInsets.all(12),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: widget.post.username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' ${widget.post.caption}'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
