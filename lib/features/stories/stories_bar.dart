import 'package:flutter/material.dart';
import 'models/story_model.dart';
import 'story_viewer.dart';

class StoriesBar extends StatelessWidget {
  StoriesBar({super.key});

  final List<StoryModel> stories = List.generate(
    10,
    (i) => StoryModel(
      username: 'user$i',
      imageUrl: '',
      viewed: i % 3 == 0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        padding: const EdgeInsets.symmetric(horizontal: 12),
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
              padding: const EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: story.viewed
                          ? null
                          : const LinearGradient(
                              colors: [Colors.purple, Colors.red, Colors.orange],
                            ),
                      border: story.viewed
                          ? Border.all(color: Colors.grey)
                          : null,
                    ),
                    child: const CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: 30),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    story.username,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
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
