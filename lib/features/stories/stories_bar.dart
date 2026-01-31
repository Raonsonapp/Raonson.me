import 'package:flutter/material.dart';
import 'story_model.dart';

class StoriesBar extends StatelessWidget {
  const StoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = [
      StoryModel(username: "You", avatar: "https://i.pravatar.cc/150?img=1"),
      StoryModel(username: "Ali", avatar: "https://i.pravatar.cc/150?img=2"),
      StoryModel(username: "Sara", avatar: "https://i.pravatar.cc/150?img=3"),
      StoryModel(username: "John", avatar: "https://i.pravatar.cc/150?img=4"),
      StoryModel(username: "Emma", avatar: "https://i.pravatar.cc/150?img=5"),
    ];

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.pink, Colors.orange, Colors.yellow],
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(story.avatar),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  story.username,
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
