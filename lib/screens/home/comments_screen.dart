import 'package:flutter/material.dart';
import '../../core/session.dart';
import '../../services/post_actions_service.dart';

class CommentsScreen extends StatefulWidget {
  final String postId;
  const CommentsScreen({super.key, required this.postId});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  List<dynamic> _comments = [];
  final _ctrl = TextEditingController();
  String _me = '';

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    _me = await Session.username() ?? '';
    _comments = await PostActionsService.comments(widget.postId);
    setState(() {});
  }

  Future<void> _send() async {
    if (_ctrl.text.trim().isEmpty) return;
    await PostActionsService.addComment(
      widget.postId,
      _me,
      _ctrl.text.trim(),
    );
    _ctrl.clear();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comments')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _comments.length,
              itemBuilder: (c, i) {
                final cm = _comments[i];
                return ListTile(
                  title: Text(cm['user']),
                  subtitle: Text(cm['text']),
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _ctrl,
                  decoration:
                      const InputDecoration(hintText: 'Add a comment'),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: _send,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
