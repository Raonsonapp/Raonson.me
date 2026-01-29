import 'package:flutter/material.dart';
import '../models/profile_model.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileModel profile = ProfileModel(
    username: 'raonson_user',
    name: 'Raonson Official',
    avatarUrl: 'https://i.pravatar.cc/300',
    bio: '🚀 Raonson App\n🎬 Anime • Reels • AI\n🇹🇯 Made in Tajikistan',
    posts: 24,
    followers: 12800,
    following: 120,
    postImages: List.generate(
      24,
      (i) => 'https://picsum.photos/300/300?random=$i',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(profile.username),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: const [
          Icon(Icons.menu),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(),
            _bio(),
            _buttons(),
            const Divider(),
            _postsGrid(),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(profile.avatarUrl),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _stat(profile.posts, 'Posts'),
                _stat(profile.followers, 'Followers'),
                _stat(profile.following, 'Following'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(int value, String label) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18),
        ),
        Text(label),
      ],
    );
  }

  Widget _bio() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            profile.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(profile.bio),
        ],
      ),
    );
  }

  Widget _buttons() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Edit Profile'),
            ),
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            onPressed: () {},
            child: const Icon(Icons.person_add),
          ),
        ],
      ),
    );
  }

  Widget _postsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: profile.postImages.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return Image.network(
          profile.postImages[index],
          fit: BoxFit.cover,
        );
      },
    );
  }
}
