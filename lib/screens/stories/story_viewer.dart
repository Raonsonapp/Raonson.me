import 'dart:async';
import 'package:flutter/material.dart';

class StoryViewer extends StatefulWidget {
  final List<dynamic> stories;
  final int startIndex;

  const StoryViewer({
    super.key,
    required this.stories,
    required this.startIndex,
  });

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  late int index;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    index = widget.startIndex;
    _startTimer();
  }

  void _startTimer() {
    timer?.cancel();
    timer = Timer(const Duration(seconds: 5), _next);
  }

  void _next() {
    if (index < widget.stories.length - 1) {
      setState(() {
        index++;
        _startTimer();
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = widget.stories[index];
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _next,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                s['media'],
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 40,
              left: 16,
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(s['avatar']),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    s['user'],
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
