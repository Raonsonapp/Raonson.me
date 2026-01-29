import 'package:flutter/material.dart';
import '../data/post_model.dart';

class PostCard extends StatefulWidget {
  final PostModel post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _likeAnim;

  @override
  void initState() {
    super.initState();
    _likeAnim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0.8,
      upperBound: 1.2,
    );
  }

  void toggleLike() {
    setState(() {
      widget.post.isLiked = !widget.post.isLiked;
    });
    _likeAnim.forward(from: 0.8);
  }

  @override
  void dispose() {
    _likeAnim.dispose();
    super.dispose();
  }

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
          title: Text(widget.post.userName,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          trailing: const Icon(Icons.more_vert),
        ),

        // Image
        GestureDetector(
          onDoubleTap: toggleLike,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.network(widget.post.imageUrl,
                  width: double.infinity, fit: BoxFit.cover),
              ScaleTransition(
                scale: _likeAnim,
                child: Icon(
                  Icons.favorite,
                  size: 100,
                  color: widget.post.isLiked
                      ? Colors.white
                      : Colors.transparent,
                ),
              ),
            ],
          ),
        ),

        // Actions
        Row(
          children: [
            IconButton(
              icon: Icon(
                widget.post.isLiked
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: widget.post.isLiked ? Colors.red : null,
              ),
              onPressed: toggleLike,
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
              icon: const Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
          ],
        ),

        // Caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: widget.post.userName,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: '  '),
                TextSpan(text: widget.post.caption),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),
      ],
    );
  }
}
