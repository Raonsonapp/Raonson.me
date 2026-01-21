import 'package:flutter/material.dart';
import '../../core/user_profile.dart';

class ProfileHeader extends StatelessWidget {
  final UserProfile profile;
  final bool verified;
  final bool isFollowing;
  final VoidCallback onFollowTap;

  const ProfileHeader({
    super.key,
    required this.profile,
    required this.verified,
    required this.isFollowing,
    required this.onFollowTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        CircleAvatar(
          radius: 44,
          child: Text(profile.username[0].toUpperCase()),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              profile.displayName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            if (verified)
              const Padding(
                padding: EdgeInsets.only(left: 6),
                child: Icon(Icons.verified, color: Colors.blue, size: 18),
              ),
          ],
        ),
        const SizedBox(height: 4),
        Text(profile.bio, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: onFollowTap,
          child: Text(isFollowing ? 'Unfollow' : 'Follow'),
        ),
      ],
    );
  }
}