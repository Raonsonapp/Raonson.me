import 'dart:convert';
import 'package:flutter/material.dart';
import '../../core/http_service.dart';
import '../../core/session.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List posts = [];
  bool loading = true;
  String username = '';

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    username = await Session.username() ?? '';
    await _loadPosts();
  }

  Future<void> _loadPosts() async {
    final res = await HttpService.get('/posts');
    posts = jsonDecode(res.body);
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: _appBar(),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadPosts,
              child: ListView(
                children: [
                  _stories(),
                  const Divider(color: Colors.white12),
                  ...posts.map(_postCard).toList(),
                ],
              ),
            ),
    );
  }

  // ================= APP BAR =================
  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0B0F1A),
      elevation: 0,
      titleSpacing: 0,
      title: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            onPressed: () {
              // Add post screen later
            },
          ),
          const Text(
            'Raonson',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.smart_toy), // Jarvis
          onPressed: () {},
        ),
      ],
    );
  }

  // ================= STORIES =================
  Widget _stories() {
    return SizedBox(
      height: 105,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: 10,
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.cyan],
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(3),
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF0B0F1A),
                      child: Icon(Icons.person),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'user$i',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ================= POST CARD =================
  Widget _postCard(dynamic post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      color: const Color(0xFF0B0F1A),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _postHeader(post),
          _postMedia(),
          _postActions(post),
          _postCaption(post),
        ],
      ),
    );
  }

  Widget _postHeader(dynamic post) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.person),
      ),
      title: Text(
        post['username'],
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: const Icon(Icons.more_vert),
    );
  }

  Widget _postMedia() {
    return Container(
      height: 360,
      color: const Color(0xFF141B2D),
      child: const Center(
        child: Icon(Icons.image, size: 80, color: Colors.white24),
      ),
    );
  }

  Widget _postActions(dynamic post) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () async {
              await HttpService.post('/posts/${post['id']}/like', {});
            },
          ),
          IconButton(
            icon: const Icon(Icons.comment_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send_outlined),
            onPressed: () {},
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _postCaption(dynamic post) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        post['caption'],
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
