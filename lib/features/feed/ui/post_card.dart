import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  final String username;
  final String imageUrl;
  final String caption;
  final int likes;

  const PostCard({
    super.key,
    required this.username,
    required this.imageUrl,
    required this.caption,
    required this.likes,
  });

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
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage('https://picsum.photos/100'),
          ),
          title: Text(
            widget.username,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.more_vert),
        ),
        GestureDetector(
          onDoubleTap: () {
            setState(() => liked = !liked);
          },
          child: Image.network(
            widget.imageUrl,
            width: double.infinity,
            height: 350,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                liked ? Icons.favorite : Icons.favorite_border,
                color: liked ? Colors.red : null,
              ),
              onPressed: () {
                setState(() => liked = !liked);
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
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '${widget.likes + (liked ? 1 : 0)} likes',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                TextSpan(
                  text: widget.username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' ${widget.caption}'),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
