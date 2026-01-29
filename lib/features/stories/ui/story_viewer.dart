import 'package:flutter/material.dart';
import '../data/story_model.dart';

class StoryViewer extends StatefulWidget {
  final StoryModel story;
  const StoryViewer({super.key, required this.story});

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  int index = 0;

  void next() {
    if (index < widget.story.mediaUrls.length - 1) {
      setState(() => index++);
    } else {
      Navigator.pop(context);
    }
  }

  void prev() {
    if (index > 0) {
      setState(() => index--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapUp: (d) {
          final w = MediaQuery.of(context).size.width;
          d.localPosition.dx < w / 2 ? prev() : next();
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                widget.story.mediaUrls[index],
                fit: BoxFit.cover,
              ),
            ),

            // Progress bar
            Positioned(
              top: 40,
              left: 8,
              right: 8,
              child: Row(
                children: List.generate(
                  widget.story.mediaUrls.length,
                  (i) => Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      height: 3,
                      color: i <= index ? Colors.white : Colors.white24,
                    ),
                  ),
                ),
              ),
            ),

            // Username
            Positioned(
              top: 60,
              left: 16,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage:
                        NetworkImage(widget.story.avatarUrl),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.story.userName,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
