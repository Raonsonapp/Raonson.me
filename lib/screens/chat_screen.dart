import 'package:flutter/material.dart';
import '../services/comment_service.dart';

class CommentsScreen extends StatefulWidget {
  final int postId;

  const CommentsScreen({super.key, required this.postId});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  late Future<List<dynamic>> commentsFuture;
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    commentsFuture = CommentService.getComments(widget.postId);
  }

  void refresh() {
    setState(() {
      commentsFuture = CommentService.getComments(widget.postId);
    });
  }

  void sendComment() async {
    if (controller.text.isEmpty) return;

    await CommentService.addComment(widget.postId, controller.text);
    controller.clear();
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comments')),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: commentsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final comments = snapshot.data ?? [];

                if (comments.isEmpty) {
                  return const Center(
                    child: Text(
                      'No comments yet',
                      style: TextStyle(color: Colors.white70),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final c = comments[index];
                    return ListTile(
                      leading: const CircleAvatar(
                        backgroundImage:
                            NetworkImage('https://i.pravatar.cc/150'),
                      ),
                      title: const Text('user'),
                      subtitle: Text(c['text']),
                    );
                  },
                );
              },
            ),
          ),
          _CommentInput(
            controller: controller,
            onSend: sendComment,
          ),
        ],
      ),
    );
  }
}

class _CommentInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const _CommentInput({
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Add a comment...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Color(0xFF4FC3F7)),
            onPressed: onSend,
          ),
        ],
      ),
    );
  }
}
