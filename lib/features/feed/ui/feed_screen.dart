import 'package:flutter/material.dart';
import '../data/post_model.dart';
import 'post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = [
      PostModel(
        userName: 'raonson',
        userAvatar:
            'https://i.pravatar.cc/150?img=3',
        imageUrl:
            'https://picsum.photos/600/600',
        caption: 'Hello Raonson 🔥',
        likes: 124,
        comments: 12,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Raonson'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (_, i) => PostCard(post: posts[i]),
      ),
    );
  }
}
