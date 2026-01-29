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
        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(width: 16),
          Icon(Icons.send),
          SizedBox(width: 12),
        ],
      ),
      body: ListView(
        children: const [
          StoriesBar(),
          Divider(height: 1),
          PostCard(),
          PostCard(),
          PostCard(),
        ],
      ),
    );
  }
}
