import 'package:flutter/material.dart';
import '../../../services/story_service.dart';
import '../../../core/session.dart';
import '../../stories/story_viewer.dart';

class StoriesBar extends StatefulWidget {
  const StoriesBar({super.key});

  @override
  State<StoriesBar> createState() => _StoriesBarState();
}

class _StoriesBarState extends State<StoriesBar> {
  List<dynamic> stories = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    stories = await StoryService.getStories();
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const SizedBox(
        height: 90,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return SizedBox(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stories.length,
        itemBuilder: (c, i) {
          final s = stories[i];
          final viewed = s['viewed'] == true;

          return GestureDetector(
            onTap: () async {
              final me = await Session.username() ?? '';
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => StoryViewer(
                    stories: stories,
                    startIndex: i,
                  ),
                ),
              );
              await StoryService.markViewed(s['id'], me);
              _load();
            },
            child: Container(
              width: 72,
              margin: const EdgeInsets.symmetric(horizontal: 6),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: viewed
                          ? null
                          : const LinearGradient(
                              colors: [
                                Colors.purple,
                                Colors.pink,
                                Colors.orange
                              ],
                            ),
                    ),
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(s['avatar']),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    s['user'],
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 11),
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
