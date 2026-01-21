import 'package:flutter/material.dart';
import '../models/user_profile.dart';

class ProfileHeader extends StatelessWidget {
  final UserProfile profile;
  final bool following;
  final VoidCallback onFollow;

  const ProfileHeader({
    super.key,
    required this.profile,
    required this.following,
    required this.onFollow,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 40, backgroundImage: NetworkImage(profile.avatar)),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(profile.username, style: const TextStyle(fontSize: 18)),
            if (profile.verified)
              const Padding(
                padding: EdgeInsets.only(left: 4),
                child: Icon(Icons.verified, color: Colors.blue, size: 18),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _stat('Posts', profile.posts),
            _stat('Followers', profile.followers),
            _stat('Following', profile.following),
          ],
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: onFollow,
          child: Text(following ? 'Unfollow' : 'Follow'),
        ),
      ],
    );
  }

  Widget _stat(String label, int value) {
    return Column(
      children: [
        Text('$value', style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label),
      ],
    );
  }
}
