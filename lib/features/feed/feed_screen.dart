import 'package:flutter/material.dart';
import 'post_card.dart';
import 'stories_bar.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Raonson')),
      body: ListView(
        children: const [
          StoriesBar(),
          Divider(),
          PostCard(),
          PostCard(),
        ],
      ),
    );
  }
}
