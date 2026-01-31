import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../data/post_model.dart';
import 'comment_sheet.dart';
import 'like_button.dart';
import 'double_tap_like.dart';

class PostCard extends StatefulWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = false;
  bool saved = false;

  void _openComments() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const CommentSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// HEADER
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text(post.user),
          trailing: const Icon(Icons.more_vert),
        ),

        /// IMAGE + DOUBLE TAP LIKE (ИСЛОҲ)
        DoubleTapLike(
          child: GestureDetector(
            onDoubleTap: () {
              setState(() => liked = true);
            },
            child: Image.network(
              post.imageUrl,
              height: 260,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),

        /// ACTION BUTTONS
        Row(
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
              onPressed: _openComments,
            ),

            IconButton(
              icon: const Icon(Icons.send_outlined),
              onPressed: () {
                Share.share("Check this post in Raonson!");
              },
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

        /// LIKES COUNT
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "${post.likes + (liked ? 1 : 0)} likes",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        /// CAPTION
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            "${post.user}  This is Raonson first post 🚀",
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
