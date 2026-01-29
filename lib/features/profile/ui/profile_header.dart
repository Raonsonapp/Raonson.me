import 'package:flutter/material.dart';
import '../data/user_model.dart';
import 'profile_stats.dart';

class ProfileHeader extends StatelessWidget {
  final UserModel user;

  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.avatar),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ProfileStatItem(label: 'Posts', value: user.posts),
                    ProfileStatItem(label: 'Followers', value: user.followers),
                    ProfileStatItem(label: 'Following', value: user.following),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(user.bio),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Edit Profile'),
            ),
          ),
        ],
      ),
    );
  }
}
