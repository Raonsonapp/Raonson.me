import 'package:flutter/material.dart';
import '../data/story_model.dart';
import 'story_viewer.dart';

class StoriesBar extends StatelessWidget {
  final List<StoryModel> stories;
  const StoriesBar({super.key, required this.stories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
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
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: const LinearGradient(
                        colors: [Colors.pink, Colors.orange],
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage(story.avatarUrl),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    story.userName,
                    style: const TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
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
