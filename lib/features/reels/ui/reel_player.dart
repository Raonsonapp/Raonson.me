import 'package:flutter/material.dart';
import '../data/reel_model.dart';
import 'reel_actions.dart';

class ReelPlayer extends StatefulWidget {
  final ReelModel reel;
  const ReelPlayer({super.key, required this.reel});

  @override
  State<ReelPlayer> createState() => _ReelPlayerState();
}

class _ReelPlayerState extends State<ReelPlayer> {
  void toggleLike() {
    setState(() {
      widget.reel.isLiked = !widget.reel.isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // VIDEO PLACEHOLDER
        Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: const Icon(
            Icons.play_circle_outline,
            size: 100,
            color: Colors.white54,
          ),
        ),

        // CAPTION
        Positioned(
          left: 16,
          bottom: 40,
          right: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.reel.userName,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                widget.reel.caption,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),

        // ACTIONS
        Positioned(
          right: 8,
          bottom: 0,
          top: 0,
          child: ReelActions(
            reel: widget.reel,
            onLike: toggleLike,
          ),
        ),
      ],
    );
  }
}
