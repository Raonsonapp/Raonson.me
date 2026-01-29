import 'package:flutter/material.dart';
import 'story_item.dart';

class StoriesBar extends StatelessWidget {
  const StoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return StoryItem(
            username: index == 0 ? 'Your story' : 'user_$index',
            isMe: index == 0,
          );
        },
      ),
    );
  }
}
