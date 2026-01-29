import 'package:flutter/material.dart';
import '../data/post_model.dart';
import 'comment_sheet.dart';

class PostCard extends StatefulWidget {
  final PostModel post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late bool liked;
  late int likes;

  @override
  void initState() {
    super.initState();
    liked = widget.post.isLiked;
    likes = widget.post.likes;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.post.userAvatar),
          ),
          title: Text(widget.post.userName),
          trailing: const Icon(Icons.more_vert),
        ),
        GestureDetector(
          onDoubleTap: () {
            setState(() {
              liked = true;
              likes++;
            });
          },
          child: Image.network(
            widget.post.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 350,
          ),
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                liked ? Icons.favorite : Icons.favorite_border,
                color: liked ? Colors.red : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  liked = !liked;
                  likes += liked ? 1 : -1;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (_) => const CommentSheet(),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {},
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text('$likes likes',
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: widget.post.userName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' ${widget.post.caption}'),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            'View all ${widget.post.comments} comments',
            style: const TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
