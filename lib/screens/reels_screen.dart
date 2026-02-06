import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: mockReels.length,
        itemBuilder: (context, index) {
          return _ReelItem(reel: mockReels[index]);
        },
      ),
    );
  }
}

/* ---------------- REEL ITEM ---------------- */

class _ReelItem extends StatelessWidget {
  final Reel reel;

  const _ReelItem({required this.reel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background (video placeholder)
        Positioned.fill(
          child: Image.network(
            reel.image,
            fit: BoxFit.cover,
          ),
        ),

        // Right actions
        Positioned(
          right: 12,
          bottom: 120,
          child: Column(
            children: const [
              _ActionIcon(icon: Icons.favorite_border, label: '12.4K'),
              SizedBox(height: 20),
              _ActionIcon(icon: Icons.chat_bubble_outline, label: '842'),
              SizedBox(height: 20),
              _ActionIcon(icon: Icons.send, label: ''),
              SizedBox(height: 20),
              _ActionIcon(icon: Icons.bookmark_border, label: ''),
            ],
          ),
        ),

        // Bottom info
        Positioned(
          left: 12,
          right: 90,
          bottom: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(reel.avatar),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    reel.username,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.verified,
                      size: 16, color: Color(0xFF4FC3F7)),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                reel.caption,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/* ---------------- ACTION ICON ---------------- */

class _ActionIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black54,
          ),
          child: Icon(icon, size: 28),
        ),
        if (label.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ]
      ],
    );
  }
}

/* ---------------- MOCK DATA ---------------- */

class Reel {
  final String username;
  final String avatar;
  final String image;
  final String caption;

  Reel({
    required this.username,
    required this.avatar,
    required this.image,
    required this.caption,
  });
}

final mockReels = [
  Reel(
    username: 'alex',
    avatar: 'https://i.pravatar.cc/150?img=2',
    image: 'https://picsum.photos/600/1000?random=10',
    caption: 'Night vibes 💙 #raonson',
  ),
  Reel(
    username: 'lina',
    avatar: 'https://i.pravatar.cc/150?img=3',
    image: 'https://picsum.photos/600/1000?random=11',
    caption: 'Dream big ✨',
  ),
  Reel(
    username: 'mark',
    avatar: 'https://i.pravatar.cc/150?img=4',
    image: 'https://picsum.photos/600/1000?random=12',
    caption: 'Life in motion 🔥',
  ),
];
