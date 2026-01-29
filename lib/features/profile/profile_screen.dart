import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('raonson'),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Icon(Icons.add_box_outlined),
          SizedBox(width: 16),
          Icon(Icons.menu),
          SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          _Header(),
          const SizedBox(height: 8),
          _Bio(),
          const SizedBox(height: 12),
          _EditButton(),
          const SizedBox(height: 12),
          _Tabs(controller: _tabController),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                _GridPosts(),
                _GridReels(),
                _GridSaved(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ================= HEADER =================

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 40),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _StatItem(count: '12', label: 'Posts'),
                _StatItem(count: '1.2K', label: 'Followers'),
                _StatItem(count: '180', label: 'Following'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String count;
  final String label;

  const _StatItem({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(count,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label,
            style: const TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }
}

// ================= BIO =================

class _Bio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Raonson',
              style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text('AI • Anime • Reels • Chat'),
          Text('Building the future 🚀'),
        ],
      ),
    );
  }
}

// ================= EDIT BUTTON =================

class _EditButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 36,
        child: OutlinedButton(
          onPressed: () {},
          child: const Text('Edit Profile'),
        ),
      ),
    );
  }
}

// ================= TABS =================

class _Tabs extends StatelessWidget {
  final TabController controller;
  const _Tabs({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: controller,
      indicatorColor: Colors.black,
      tabs: const [
        Tab(icon: Icon(Icons.grid_on)),
        Tab(icon: Icon(Icons.video_library)),
        Tab(icon: Icon(Icons.bookmark)),
      ],
    );
  }
}

// ================= GRIDS =================

class _GridPosts extends StatelessWidget {
  const _GridPosts();

  @override
  Widget build(BuildContext context) {
    return _GridTemplate(icon: Icons.image);
  }
}

class _GridReels extends StatelessWidget {
  const _GridReels();

  @override
  Widget build(BuildContext context) {
    return _GridTemplate(icon: Icons.play_arrow);
  }
}

class _GridSaved extends StatelessWidget {
  const _GridSaved();

  @override
  Widget build(BuildContext context) {
    return _GridTemplate(icon: Icons.bookmark);
  }
}

class _GridTemplate extends StatelessWidget {
  final IconData icon;
  const _GridTemplate({required this.icon});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(4),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: 18,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.grey.shade300,
          child: Center(child: Icon(icon)),
        );
      },
    );
  }
}
