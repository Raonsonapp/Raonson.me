import 'package:flutter/material.dart';
import '../../models/post_model.dart';
import '../../services/post_service.dart';
import '../../core/session.dart';

/// =======================================
/// PROFILE SCREEN – RAONSON v2 (FULL)
/// =======================================

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  String username = 'user';
  List<PostModel> posts = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _load();
  }

  Future<void> _load() async {
    username = await Session.username() ?? 'user';

    final data = await PostService.getPosts();
    setState(() {
      posts = data.where((p) => p.username == username).toList();
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: _appBar(),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _header(),
                _stats(),
                _buttons(),
                _tabs(),
                Expanded(child: _tabViews()),
              ],
            ),
    );
  }

  // -------------------------------
  // APP BAR
  // -------------------------------
  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0B0F1A),
      elevation: 0,
      title: Text(username),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await Session.logout();
            if (!mounted) return;
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/',
              (_) => false,
            );
          },
        )
      ],
    );
  }

  // -------------------------------
  // HEADER
  // -------------------------------
  Widget _header() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: CircleAvatar(
        radius: 46,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.person, size: 48),
      ),
    );
  }

  // -------------------------------
  // STATS
  // -------------------------------
  Widget _stats() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _stat('Posts', posts.length),
          _stat('Followers', 128),
          _stat('Following', 94),
        ],
      ),
    );
  }

  Widget _stat(String label, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }

  // -------------------------------
  // BUTTONS
  // -------------------------------
  Widget _buttons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: _button('Edit profile'),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: _button('Share profile'),
          ),
        ],
      ),
    );
  }

  Widget _button(String label) {
    return Container(
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white10,
      ),
      child: Text(label),
    );
  }

  // -------------------------------
  // TABS
  // -------------------------------
  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      indicatorColor: Colors.blueAccent,
      tabs: const [
        Tab(icon: Icon(Icons.grid_on)),
        Tab(icon: Icon(Icons.bookmark)),
      ],
    );
  }

  Widget _tabViews() {
    return TabBarView(
      controller: _tabController,
      children: [
        _postsGrid(),
        _savedGrid(),
      ],
    );
  }

  // -------------------------------
  // POSTS GRID
  // -------------------------------
  Widget _postsGrid() {
    if (posts.isEmpty) {
      return const Center(
        child: Text(
          'No posts yet',
          style: TextStyle(color: Colors.white54),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(2),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return Container(
          color: const Color(0xFF1C2333),
          child: const Icon(Icons.image, color: Colors.white24),
        );
      },
    );
  }

  // -------------------------------
  // SAVED GRID (MOCK)
  // -------------------------------
  Widget _savedGrid() {
    return const Center(
      child: Text(
        'Saved posts',
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
