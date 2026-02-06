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
        itemBuilder: (context, i) => _reel(),
      ),
    );
  }

  Widget _reel() {
    return Stack(
      children: [
        const Center(
          child: Icon(Icons.play_arrow, size: 100, color: Colors.white24),
        ),
        Positioned(
          right: 12,
          bottom: 100,
          child: Column(
            children: const [
              _Action(Icons.favorite_border, '12k'),
              SizedBox(height: 22),
              _Action(Icons.chat_bubble_outline, '320'),
              SizedBox(height: 22),
              _Action(Icons.send, ''),
              SizedBox(height: 22),
              _Action(Icons.bookmark_border, ''),
            ],
          ),
        ),
        Positioned(
          left: 12,
          bottom: 24,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('username', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 6),
              Text('Reels caption ✨', maxLines: 2),
            ],
          ),
        ),
      ],
    );
  }
}

class _Action extends StatelessWidget {
  final IconData icon;
  final String label;
  const _Action(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32),
        if (label.isNotEmpty)
          Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
