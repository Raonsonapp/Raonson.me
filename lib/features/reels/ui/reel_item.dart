import 'package:flutter/material.dart';
import '../data/reel_model.dart';
import 'reel_actions.dart';

class ReelItem extends StatelessWidget {
  final ReelModel reel;

  const ReelItem({super.key, required this.reel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Placeholder for video
        Image.network(
          reel.mediaUrl,
          fit: BoxFit.cover,
        ),

        // Gradient overlay
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black54, Colors.transparent],
            ),
          ),
        ),

        // Bottom left: username + caption
        Positioned(
          left: 16,
          bottom: 24,
          right: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: NetworkImage(reel.userAvatar),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    reel.username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                reel.caption,
                style: const TextStyle(color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        // Right actions
        Positioned(
          right: 16,
          bottom: 80,
          child: ReelActions(
            isLiked: reel.isLiked,
            likes: reel.likes,
          ),
        ),
      ],
    );
  }
}
