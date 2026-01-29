import 'package:flutter/material.dart';

class StoryViewer extends StatefulWidget {
  const StoryViewer({super.key});

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTapUp: (_) {
          setState(() {
            index = (index + 1) % 5;
          });
        },
        onVerticalDragEnd: (_) {
          Navigator.pop(context);
        },
        child: Stack(
          children: [
            // STORY CONTENT
            Center(
              child: Text(
                'Story ${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
            ),

            // TOP BAR
            Positioned(
              top: 40,
              left: 12,
              right: 12,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'raonson',
                    style: TextStyle(color: Colors.white),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
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
