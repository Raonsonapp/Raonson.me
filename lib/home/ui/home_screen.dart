import 'package:flutter/material.dart';
import 'story_bar.dart';
import 'post_card.dart';
import '../models/post_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<PostModel> posts = List.generate(
    5,
    (index) => PostModel(
      username: 'user$index',
      userAvatar: 'https://i.pravatar.cc/150?img=$index',
      imageUrl: 'https://picsum.photos/500/500?random=$index',
      caption: 'This is a demo post number $index',
      likes: 120 + index,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raonson'),
        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(width: 16),
          Icon(Icons.send),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        children: [
          const StoryBar(),
          const Divider(),
          ...posts.map((post) => PostCard(post: post)),
        ],
      ),
    );
  }
}
