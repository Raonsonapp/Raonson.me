import 'package:flutter/material.dart';
import 'story_viewer.dart';
import '../data/story_model.dart';

class StoriesBar extends StatelessWidget {
  const StoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    final stories = List.generate(
      10,
      (i) => StoryModel(
        userName: 'user_$i',
        avatarUrl: 'https://i.pravatar.cc/150?img=$i',
        mediaUrls: [
          'https://picsum.photos/600/900?random=$i',
          'https://picsum.photos/600/900?random=${i + 20}',
        ],
      ),
    );

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (_, i) {
          final story = stories[i];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => StoryViewer(story: story),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [Colors.pink, Colors.orange],
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(story.avatarUrl),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    story.userName,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
