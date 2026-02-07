import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return _reelItem();
        },
      ),
    );
  }

  Widget _reelItem() {
    return Stack(
      children: [
        // VIDEO PLACEHOLDER
        Container(
          color: Colors.black,
          child: const Center(
            child: Icon(
              Icons.play_circle_outline,
              size: 90,
              color: Colors.white24,
            ),
          ),
        ),

        // RIGHT ICONS
        Positioned(
          right: 14,
          bottom: 120,
          child: Column(
            children: [
              _icon(Icons.favorite_border, '12.4k'),
              const SizedBox(height: 18),
              _icon(Icons.chat_bubble_outline, '532'),
              const SizedBox(height: 18),
              _icon(Icons.send, ''),
              const SizedBox(height: 18),
              _icon(Icons.bookmark_border, ''),
            ],
          ),
        ),

        // USER + CAPTION
        Positioned(
          left: 14,
          bottom: 30,
          right: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '@username',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'This is a reels caption example for Raonson.',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _icon(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.35),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.35),
                blurRadius: 18,
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        if (label.isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ],
    );
  }
}
