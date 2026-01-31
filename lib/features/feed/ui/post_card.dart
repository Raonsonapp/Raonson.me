import 'package:flutter/material.dart';
import 'comment_sheet.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = false;
  int likes = 120;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // USER HEADER
        ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: const Text("Raonson User"),
          trailing: const Icon(Icons.more_vert),
        ),

        // IMAGE
        Container(
          height: 250,
          color: Colors.grey.shade300,
          child: const Center(child: Icon(Icons.image, size: 60)),
        ),

        // ACTIONS
        Row(
          children: [
            IconButton(
              icon: Icon(
                liked ? Icons.favorite : Icons.favorite_border,
                color: liked ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  liked = !liked;
                  liked ? likes++ : likes--;
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.comment_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.share_outlined),
              onPressed: () {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) => const CommentSheet(),
  );
},

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text("$likes likes"),
        ),

        const Padding(
          padding: EdgeInsets.all(12),
          child: Text("This is Raonson post 🔥"),
        ),

        const Divider(),
      ],
    );
  }
}
