import 'package:flutter/material.dart';
import 'stories_bar.dart';
import 'post_card.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Raonson',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: const [
          StoriesBar(),
          Divider(height: 1),
          PostCard(
            username: 'ehson',
            imageUrl: 'https://picsum.photos/500/500',
            caption: 'Салом аз Raonson 👋',
            likes: 128,
          ),
          PostCard(
            username: 'raonson_ai',
            imageUrl: 'https://picsum.photos/501/501',
            caption: 'Версияи аввал 🚀',
            likes: 342,
          ),
        ],
      ),
    );
  }
}
