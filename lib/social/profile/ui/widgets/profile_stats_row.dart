import 'package:flutter/material.dart';
import '../../core/profile_stats.dart';

class ProfileStatsRow extends StatelessWidget {
  final ProfileStats stats;
  const ProfileStatsRow({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _item('Posts', stats.posts),
          _item('Followers', stats.followers),
          _item('Following', stats.following),
        ],
      ),
    );
  }

  Widget _item(String label, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}