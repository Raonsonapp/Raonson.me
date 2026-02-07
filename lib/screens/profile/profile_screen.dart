import 'package:flutter/material.dart';

/// ===============================
/// PROFILE SCREEN – RAONSON v2
/// Full profile page (Instagram-style)
/// ===============================

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // -------------------------------
  // MOCK USER DATA (ба сервер иваз мешавад)
  // -------------------------------
  final String username = 'raonson_user';
  final String bio =
      'Raonson • Technology • Creativity\nBuilding the future 🚀';
  final int postsCount = 42;
  final int followers = 12800;
  final int following = 312;

  final List<int> posts = List.generate(24, (i) => i);
  final List<int> reels = List.generate(12, (i) => i);
  final List<int> saved = List.generate(9, (i) => i);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // -------------------------------
  // BUILD
  // -------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _header(),
          const SizedBox(height: 12),
          _actionButtons(),
          const SizedBox(height: 16),
          _tabs(),
          Expanded(child: _tabViews()),
        ],
      ),
    );
  }

  // -------------------------------
  // APP BAR
  // -------------------------------
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0B0F1A),
      elevation: 0,
      title: Text(
        username,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
      ],
    );
  }

  // -------------------------------
  // HEADER (AVATAR + STATS + BIO)
  // -------------------------------
  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _avatar(),
              const SizedBox(width: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _statItem('Posts', postsCount),
                    _statItem('Followers', followers),
                    _statItem('Following', following),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            username,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            bio,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _avatar() {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.cyanAccent],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.6),
            blurRadius: 14,
          ),
        ],
      ),
      child: const CircleAvatar(
        radius: 42,
        backgroundColor: Color(0xFF1C2333),
        child: Icon(Icons.person, size: 42),
      ),
    );
  }

  Widget _statItem(String label, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  // -------------------------------
  // ACTION BUTTONS
  // -------------------------------
  Widget _actionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _actionButton('Edit Profile'),
          ),
          const SizedBox(width: 10),
          _iconButton(Icons.person_add),
        ],
      ),
    );
  }

  Widget _actionButton(String text) {
    return Container(
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white10,
      ),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _iconButton(IconData icon) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white10,
      ),
      child: Icon(icon, size: 20),
    );
  }

  // -------------------------------
  // TABS
  // -------------------------------
  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      indicatorColor: Colors.blueAccent,
      indicatorWeight: 2,
      tabs: const [
        Tab(icon: Icon(Icons.grid_on)),
        Tab(icon: Icon(Icons.play_circle_outline)),
        Tab(icon: Icon(Icons.bookmark_border)),
      ],
    );
  }

  Widget _tabViews() {
    return TabBarView(
      controller: _tabController,
      children: [
        _grid(posts),
        _grid(reels),
        _grid(saved),
      ],
    );
  }

  // -------------------------------
  // GRID
  // -------------------------------
  Widget _grid(List<int> items) {
    return GridView.builder(
      padding: const EdgeInsets.all(4),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _gridItem(items[index]);
      },
    );
  }

  Widget _gridItem(int id) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1C2333),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Center(
        child: Icon(
          Icons.image,
          color: Colors.white24,
          size: 30,
        ),
      ),
    );
  }
}
