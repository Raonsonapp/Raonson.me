import 'package:flutter/material.dart';
import 'story_circle.dart';
import 'story_model.dart';

class StoriesBar extends StatelessWidget {
  const StoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = [
      StoryModel(
        username: 'your_story',
        avatarUrl: 'https://i.pravatar.cc/150?img=1',
      ),
      StoryModel(
        username: 'naruto',
        avatarUrl: 'https://i.pravatar.cc/150?img=2',
      ),
      StoryModel(
        username: 'luffy',
        avatarUrl: 'https://i.pravatar.cc/150?img=3',
      ),
      StoryModel(
        username: 'sasuke',
        avatarUrl: 'https://i.pravatar.cc/150?img=4',
      ),
    ];

    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          return StoryCircle(story: stories[index]);
        },
      ),
    );
  }
}
