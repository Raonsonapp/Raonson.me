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
          return const _ReelItem();
        },
      ),
    );
  }
}

// ================= SINGLE REEL =================

class _ReelItem extends StatelessWidget {
  const _ReelItem();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // VIDEO PLACEHOLDER
        Container(
          color: Colors.black,
          child: const Center(
            child: Icon(Icons.play_circle_outline,
                size: 80, color: Colors.white),
          ),
        ),

        // RIGHT ACTIONS
        Positioned(
          right: 12,
          bottom: 120,
          child: Column(
            children: const [
              _ActionButton(icon: Icons.favorite_border, label: '12.3K'),
              SizedBox(height: 16),
              _ActionButton(icon: Icons.comment, label: '321'),
              SizedBox(height: 16),
              _ActionButton(icon: Icons.send, label: 'Share'),
              SizedBox(height: 16),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person),
              ),
            ],
          ),
        ),

        // BOTTOM INFO
        Positioned(
          left: 12,
          bottom: 24,
          right: 80,
          child: const _ReelInfo(),
        ),
      ],
    );
  }
}

// ================= ACTION BUTTON =================

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 28),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}

// ================= REEL INFO =================

class _ReelInfo extends StatelessWidget {
  const _ReelInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '@raonson',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6),
        Text(
          'This is a sample reel caption 🚀🔥',
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 6),
        Row(
          children: [
            Icon(Icons.music_note, color: Colors.white, size: 16),
            SizedBox(width: 4),
            Text(
              'Original Audio',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
