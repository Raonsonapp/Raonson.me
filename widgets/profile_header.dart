import 'package:flutter/material.dart';
import 'profile_stats.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 40),
              ),
              SizedBox(width: 20),
              Expanded(child: ProfileStats()),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Raonson User',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            '🚀 Anime • AI • Reels\nBuilding next generation app',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
