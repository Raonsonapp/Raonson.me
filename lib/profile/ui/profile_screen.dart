import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('raonson'),
        centerTitle: false,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),
      body: ListView(
        children: [
          _topProfile(),
          const SizedBox(height: 12),
          _bio(),
          const SizedBox(height: 12),
          _actionButtons(),
          const SizedBox(height: 16),
          _highlights(),
          const Divider(),
          _tabs(),
          _postsGrid(),
        ],
      ),
    );
  }

  // 👤 Avatar + Stats
  Widget _topProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              'https://i.pravatar.cc/150?img=3',
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _StatItem(value: '24', label: 'Posts'),
                _StatItem(value: '3.2K', label: 'Followers'),
                _StatItem(value: '180', label: 'Following'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 📝 Bio
  Widget _bio() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Raonson Official',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text('🔥 Social + AI Platform'),
          Text('🎬 Reels • AI • NextToon'),
          Text('🌍 Made in Tajikistan'),
        ],
      ),
    );
  }

  // ✏️ Buttons
  Widget _actionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Edit Profile'),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Share Profile'),
            ),
          ),
        ],
      ),
    );
  }

  // ⭐ Highlights
  Widget _highlights() {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.black12,
                  child: Icon(Icons.add),
                ),
                const SizedBox(height: 4),
                Text(
                  index == 0 ? 'New' : 'Story',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // 📑 Tabs
  Widget _tabs() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(Icons.grid_on),
        Icon(Icons.video_library_outlined),
        Icon(Icons.person_pin_outlined),
      ],
    );
  }

  // 🖼 Posts Grid
  Widget _postsGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.grey.shade300,
          child: const Icon(Icons.image),
        );
      },
    );
  }
}

// 📊 Stat widget
class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(label),
      ],
    );
  }
}
