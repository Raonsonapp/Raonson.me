import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/http_service.dart';
import '../../core/session.dart';
import '../../services/post_service.dart';
import '../create/create_post_screen.dart';
import '../comments/comments_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = true;
  List<dynamic> _posts = [];
  String _me = '';

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    final u = await Session.username() ?? '';
    _me = u;
    await _loadPosts();
  }

  Future<void> _loadPosts() async {
    try {
      final data = await PostService.getAll();
      setState(() {
        _posts = data;
        _loading = false;
      });
    } catch (e) {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadPosts,
              child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  return _postCard(_posts[index]);
                },
              ),
            ),
    );
  }

  // ================= APP BAR =================
  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        'Raonson',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      leading: IconButton(
        icon: const Icon(Icons.add_box_outlined),
        onPressed: () async {
          final ok = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreatePostScreen()),
          );
          if (ok == true) _loadPosts();
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.smart_toy), // Jarvis
          onPressed: () {},
        ),
      ],
    );
  }

  // ================= POST CARD =================
  Widget _postCard(dynamic post) {
    final int postId = post['id'];
    final String username = post['username'] ?? '';
    final String caption = post['caption'] ?? '';
    final String imageUrl = post['image_url'] ?? '';
    final int likes = post['likes'] ?? 0;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      color: const Color(0xFF0F1424),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== HEADER =====
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(username),
            trailing: const Icon(Icons.more_vert),
          ),

          // ===== IMAGE =====
          if (imageUrl.isNotEmpty)
            Image.network(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const SizedBox(
                height: 250,
                child: Center(child: Icon(Icons.broken_image)),
              ),
            ),

          // ===== ACTIONS =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () async {
                    await PostService.like(postId);
                    _loadPosts();
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.mode_comment_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CommentsScreen(postId: postId),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {},
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.bookmark_border),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // ===== LIKES =====
          if (likes > 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                '$likes likes',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

          // ===== CAPTION =====
          if (caption.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                      text: '$username ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: caption),
                  ],
                ),
              ),
            ),

          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
