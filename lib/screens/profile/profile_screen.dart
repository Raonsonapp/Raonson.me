import 'dart:convert';
import 'package:flutter/material.dart';
import '../../core/http_service.dart';
import '../../core/session.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  String username = '';
  bool loading = true;
  List posts = [];

  late TabController _tab;

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);
    _init();
  }

  Future<void> _init() async {
    username = await Session.username() ?? '';
    await _loadPosts();
  }

  Future<void> _loadPosts() async {
    final res = await HttpService.get('/posts');
    final all = jsonDecode(res.body);
    posts = all.where((p) => p['username'] == username).toList();
    setState(() => loading = false);
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
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
                const SizedBox(height: 12),
                _tabs(),
                Expanded(child: _tabViews()),
              ],
            ),
    );
  }

  // ================= APP BAR =================
  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0B0F1A),
      elevation: 0,
      title: Text(
        username,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
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
        ),
      ],
    );
  }

  // ================= HEADER =================
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

  // ================= STATS =================
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

  // ================= BUTTONS =================
  Widget _buttons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(child: _btn('Edit profile')),
          const SizedBox(width: 12),
          Expanded(child: _btn('Share profile')),
        ],
      ),
    );
  }

  Widget _btn(String label) {
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

  // ================= TABS =================
  Widget _tabs() {
    return TabBar(
      controller: _tab,
      indicatorColor: Colors.blueAccent,
      tabs: const [
        Tab(icon: Icon(Icons.grid_on)),
        Tab(icon: Icon(Icons.bookmark_border)),
      ],
    );
  }

  Widget _tabViews() {
    return TabBarView(
      controller: _tab,
      children: [
        _postsGrid(),
        _saved(),
      ],
    );
  }

  // ================= POSTS GRID =================
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
      itemBuilder: (_, i) {
        return Container(
          color: const Color(0xFF141B2D),
          child: const Icon(
            Icons.image,
            color: Colors.white24,
          ),
        );
      },
    );
  }

  // ================= SAVED (MOCK) =================
  Widget _saved() {
    return const Center(
      child: Text(
        'Saved posts',
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
