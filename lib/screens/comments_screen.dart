import 'package:flutter/material.dart';

class CommentsScreen extends StatelessWidget {
  final int postId;

  const CommentsScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comments')),
      body: Center(
        child: Text(
          'Comments for post $postId',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
