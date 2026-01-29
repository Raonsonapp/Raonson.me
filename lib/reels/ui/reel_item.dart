import 'package:flutter/material.dart';
import '../models/reel_model.dart';

class ReelItem extends StatefulWidget {
  final ReelModel reel;
  const ReelItem({super.key, required this.reel});

  @override
  State<ReelItem> createState() => _ReelItemState();
}

class _ReelItemState extends State<ReelItem> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Placeholder for video
        Container(
          color: Colors.black,
          child: Center(
            child: Icon(
              Icons.play_circle_outline,
              size: 80,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ),

        // Double tap like
        GestureDetector(
          onDoubleTap: () {
            setState(() => liked = true);
          },
          child: Container(color: Colors.transparent),
        ),

        // Right actions
        Positioned(
          right: 12,
          bottom: 80,
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(widget.reel.avatarUrl),
              ),
              const SizedBox(height: 16),
              Icon(
                liked ? Icons.favorite : Icons.favorite_border,
                color: liked ? Colors.red : Colors.white,
                size: 32,
              ),
              Text(
                '${widget.reel.likes + (liked ? 1 : 0)}',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Icon(Icons.chat_bubble_outline,
                  color: Colors.white, size: 28),
              const SizedBox(height: 16),
              const Icon(Icons.send, color: Colors.white, size: 28),
            ],
          ),
        ),

        // Bottom text
        Positioned(
          left: 12,
          bottom: 24,
          right: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.reel.username,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(
                widget.reel.caption,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
