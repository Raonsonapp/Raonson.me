import 'package:flutter/material.dart';
import '../../stories/ui/stories_bar.dart';
import '../data/post_model.dart';
import '../ui/post_card.dart';
import '../../stories/data/story_model.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = List.generate(
      10,
      (i) => StoryModel(
        id: '$i',
        username: 'user$i',
        avatarUrl: 'https://i.pravatar.cc/150?img=$i',
      ),
    );

    final posts = List.generate(
      5,
      (i) => PostModel(
        id: '$i',
        username: 'user$i',
        userAvatar: 'https://i.pravatar.cc/150?img=$i',
        imageUrl: 'https://picsum.photos/500/500?random=$i',
        caption: 'This is a sample caption #$i',
        likes: 120 + i,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Raonson',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.favorite_border),
          SizedBox(width: 12),
          Icon(Icons.send),
          SizedBox(width: 12),
        ],
      ),
      body: ListView(
        children: [
          StoriesBar(stories: stories),
          const Divider(),
          ...posts.map((p) => PostCard(post: p)),
        ],
      ),
    );
  }
}
