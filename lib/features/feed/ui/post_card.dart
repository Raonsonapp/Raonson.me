import 'package:flutter/material.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = false;
  int likeCount = 12;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // IMAGE
          Container(
            height: 200,
            color: Colors.grey.shade300,
            child: const Center(child: Text("POST IMAGE")),
          ),

          const SizedBox(height: 8),

          // ACTIONS ROW
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
                    liked ? likeCount++ : likeCount--;
                  });
                },
              ),

              IconButton(
                icon: const Icon(Icons.comment_outlined),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => const _CommentSheet(),
                  );
                },
              ),

            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text("$likeCount likes"),
          ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class _CommentSheet extends StatelessWidget {
  const _CommentSheet();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: const [
          SizedBox(height: 10),
          Text("Comments"),
          Divider(),
          ListTile(title: Text("User1: Nice!")),
          ListTile(title: Text("User2: Cool 🔥")),
        ],
      ),
    );
  }
}
