import 'package:flutter/material.dart';
import 'models/story_model.dart';

class StoryViewer extends StatefulWidget {
  final StoryModel story;
  const StoryViewer({super.key, required this.story});

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
          ..forward()
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.pop(context);
            }
          });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Stack(
          children: [
            const Center(
              child: Icon(Icons.image, size: 200, color: Colors.white24),
            ),
            Positioned(
              top: 40,
              left: 16,
              right: 16,
              child: LinearProgressIndicator(
                value: _controller.value,
                backgroundColor: Colors.white24,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            Positioned(
              top: 60,
              left: 16,
              child: Row(
                children: [
                  const CircleAvatar(radius: 16),
                  const SizedBox(width: 8),
                  Text(
                    widget.story.username,
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
