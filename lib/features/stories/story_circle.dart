import 'package:flutter/material.dart';
import 'story_model.dart';

class StoryCircle extends StatelessWidget {
  final StoryModel story;

  const StoryCircle({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: story.isViewed
                  ? null
                  : const LinearGradient(
                      colors: [Colors.purple, Colors.red, Colors.orange],
                    ),
            ),
            child: CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(story.avatarUrl),
            ),
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: 70,
            child: Text(
              story.username,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
