import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 6,
        itemBuilder: (context, index) {
          return _ReelItem(index: index);
        },
      ),
    );
  }
}

// ================= SINGLE REEL =================

class _ReelItem extends StatelessWidget {
  final int index;

  const _ReelItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // VIDEO PLACEHOLDER
        Container(
          color: Colors.black,
          child: const Center(
            child: Icon(
              Icons.play_circle_fill,
              color: Colors.white,
              size: 80,
            ),
          ),
        ),

        // RIGHT ACTIONS
        Positioned(
          right: 12,
          bottom: 120,
          child: Column(
            children: [
              _ActionButton(icon: Icons.favorite, label: '12.4K'),
              _ActionButton(icon: Icons.comment, label: '322'),
              _ActionButton(icon: Icons.send, label: 'Share'),
              const SizedBox(height: 10),
              const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
            ],
          ),
        ),

        // BOTTOM INFO
        Positioned(
          left: 12,
          bottom: 40,
          right: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '@user$index',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'This is a demo reel on Raonson 🔥🔥',
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 6),
              Row(
                children: const [
                  Icon(Icons.music_note, color: Colors.white, size: 16),
                  SizedBox(width: 4),
                  Text(
                    'Original audio',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ================= ACTION BUTTON =================

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionButton({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 30),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
