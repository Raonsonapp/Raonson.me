import 'package:flutter/material.dart';
import '../../core/session.dart';
import '../../services/post_service.dart';
import '../../services/post_actions_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  String _me = '';
  String _bio = '';
  bool _loading = true;

  List<dynamic> _myPosts = [];
  List<dynamic> _savedPosts = [];

  late TabController _tabCtrl;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 2, vsync: this);
    _init();
  }

  Future<void> _init() async {
    _me = await Session.username() ?? '';
    await _loadData();
  }

  Future<void> _loadData() async {
    try {
      final posts = await PostService.getByUser(_me);
      final saved = await PostActionsService.getSaved(_me);

      setState(() {
        _myPosts = posts;
        _savedPosts = saved;
        _bio = posts.isNotEmpty ? (posts.first['bio'] ?? '') : '';
        _loading = false;
      });
    } catch (_) {
      setState(() => _loading = false);
    }
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1424),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1424),
        elevation: 0,
        title: Text(
          _me,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await Session.logout();
              if (mounted) {
                Navigator.pushReplacementNamed(context, '/login');
              }
            },
          ),
        ],
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                _header(),
                const SizedBox(height: 12),
                _tabs(),
                Expanded(
                  child: TabBarView(
                    controller: _tabCtrl,
                    children: [
                      _grid(_myPosts),
                      _grid(_savedPosts),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  // ================= HEADER =================
  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 38,
                backgroundColor: Colors.white24,
                child: Icon(Icons.person, size: 40),
              ),
              const Spacer(),
              _stat('Posts', _myPosts.length),
              const SizedBox(width: 16),
              _stat('Followers', 0),
              const SizedBox(width: 16),
              _stat('Following', 0),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            _me,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          if (_bio.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                _bio,
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                // edit profile (баъд)
              },
              child: const Text('Edit profile'),
            ),
          ),
        ],
      ),
    );
  }

  // ================= TABS =================
  Widget _tabs() {
    return TabBar(
      controller: _tabCtrl,
      indicatorColor: Colors.white,
      tabs: const [
        Tab(icon: Icon(Icons.grid_on)),
        Tab(icon: Icon(Icons.bookmark)),
      ],
    );
  }

  // ================= GRID =================
  Widget _grid(List<dynamic> posts) {
    if (posts.isEmpty) {
      return const Center(
        child: Text(
          'No posts',
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
      itemBuilder: (c, i) {
        final p = posts[i];
        final img = p['image_url'];
        return Container(
          color: Colors.black12,
          child: img != null && img.isNotEmpty
              ? Image.network(
                  img,
                  fit: BoxFit.cover,
                )
              : const Center(child: Icon(Icons.image)),
        );
      },
    );
  }

  // ================= STAT =================
  Widget _stat(String label, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}
