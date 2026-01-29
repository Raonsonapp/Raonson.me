import 'package:flutter/material.dart';
import 'post_card.dart';
import '../data/post_model.dart';
import '../../stories/ui/stories_bar.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posts = List.generate(
      10,
      (i) => PostModel(
        userName: 'user_$i',
        userAvatar: 'https://i.pravatar.cc/150?img=$i',
        imageUrl: 'https://picsum.photos/600/600?random=$i',
        caption: 'This is a sample post caption #$i',
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Raonson',
            style: TextStyle(fontWeight: FontWeight.bold)),
        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(width: 12),
          Icon(Icons.send),
          SizedBox(width: 12),
        ],
      ),
      body: ListView(
        children: [
          const StoriesBar(),
          const Divider(height: 1),
          ...posts.map((p) => PostCard(post: p)).toList(),
        ],
      ),
    );
  }
}
