import 'package:flutter/material.dart';
import '../services/reel_service.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: ReelService.getReels(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error loading reels"));
          }

          final reels = snapshot.data!;
          if (reels.isEmpty) {
            return const Center(child: Text("No reels yet"));
          }

          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: reels.length,
            itemBuilder: (context, index) {
              final reel = reels[index];
              return _ReelItem(reel: reel);
            },
          );
        },
      ),
    );
  }
}

/* ---------------- SINGLE REEL ---------------- */

class _ReelItem extends StatelessWidget {
  final Map<String, dynamic> reel;

  const _ReelItem({required this.reel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background (placeholder image for v1)
        Positioned.fill(
          child: Image.network(
            "https://picsum.photos/600/1000?random=${reel['id']}",
            fit: BoxFit.cover,
          ),
        ),

        // Right side actions
        Positioned(
          right: 12,
          bottom: 120,
          child: Column(
            children: const [
              _ActionIcon(icon: Icons.favorite_border, label: 'Like'),
              SizedBox(height: 20),
              _ActionIcon(icon: Icons.chat_bubble_outline, label: 'Comment'),
              SizedBox(height: 20),
              _ActionIcon(icon: Icons.send, label: 'Share'),
              SizedBox(height: 20),
              _ActionIcon(icon: Icons.bookmark_border, label: 'Save'),
            ],
          ),
        ),

        // Bottom info
        Positioned(
          left: 12,
          right: 90,
          bottom: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage:
                        NetworkImage("https://i.pravatar.cc/150?img=1"),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "user",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.verified,
                      size: 16, color: Color(0xFF4FC3F7)),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                reel['caption'] ?? '',
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
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
