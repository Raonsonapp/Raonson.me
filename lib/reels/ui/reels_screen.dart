import 'package:flutter/material.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _videoPlaceholder(),
          _rightActions(),
          _bottomInfo(),
        ],
      ),
    );
  }

  // 🎬 Video placeholder (later real video)
  Widget _videoPlaceholder() {
    return Container(
      color: Colors.black,
      child: const Center(
        child: Icon(
          Icons.play_arrow,
          size: 80,
          color: Colors.white70,
        ),
      ),
    );
  }

  // ❤️ 💬 ➤ buttons
  Widget _rightActions() {
    return Positioned(
      right: 12,
      bottom: 120,
      child: Column(
        children: [
          _iconButton(
            icon: liked ? Icons.favorite : Icons.favorite_border,
            color: liked ? Colors.red : Colors.white,
            label: '12.3K',
            onTap: () => setState(() => liked = !liked),
          ),
          const SizedBox(height: 16),
          _iconButton(
            icon: Icons.chat_bubble_outline,
            label: '432',
            onTap: () {},
          ),
          const SizedBox(height: 16),
          _iconButton(
            icon: Icons.send,
            label: 'Share',
            onTap: () {},
          ),
          const SizedBox(height: 16),
          _iconButton(
            icon: Icons.more_vert,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _iconButton({
    required IconData icon,
    String? label,
    Color color = Colors.white,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Icon(icon, size: 32, color: color),
        ),
        if (label != null) ...[
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ]
      ],
    );
  }

  // 👤 Username + caption + music
  Widget _bottomInfo() {
    return Positioned(
      left: 12,
      right: 80,
      bottom: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '@raonson_official',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6),
          Text(
            'This is a Reel demo 🔥',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.music_note, color: Colors.white, size: 16),
              SizedBox(width: 4),
              Text(
                'Original Audio',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
