import 'package:flutter/material.dart';
import '../data/story_model.dart';
import 'story_avatar.dart';

class StoriesBar extends StatelessWidget {
  final List<StoryModel> stories;

  const StoriesBar({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (_, index) {
          final story = stories[index];
          return Column(
            children: [
              StoryAvatar(
                imageUrl: story.avatarUrl,
                isViewed: story.isViewed,
              ),
              const SizedBox(height: 6),
              Text(
                story.username,
                style: const TextStyle(fontSize: 12),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemCount: stories.length,
      ),
    );
  }
}
