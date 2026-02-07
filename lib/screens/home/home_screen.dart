import 'package:flutter/material.dart';
import '../../models/post.dart';
import '../../core/api.dart';
import '../../core/http_client.dart';
import '../../models/post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts = [];
  bool loading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  Future<void> loadPosts() async {
    try {
      final data = await HttpClient.get(
        '${ApiConfig.baseUrl}/posts',
      );
      setState(() {
        posts = data.map<Post>((e) => Post.fromJson(e)).toList();
        loading = false;
      });
    } catch (e) {
      setState(() {
        error = 'Failed to load feed';
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        title: const Text(
          'Raonson',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : error != null
              ? Center(
                  child: Text(error!, style: const TextStyle(color: Colors.red)),
                )
              : RefreshIndicator(
                  onRefresh: loadPosts,
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (c, i) => _PostCard(post: posts[i]),
                  ),
                ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final Post post;
  const _PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 10, 12, 14),
      decoration: BoxDecoration(
        color: const Color(0xFF11162A),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.18),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.person, color: Colors.white, size: 18),
                ),
                const SizedBox(width: 10),
                Text(
                  post.username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.more_vert, color: Colors.white54),
              ],
            ),
          ),

          // MEDIA (placeholder, server-ready)
          Container(
            height: 240,
            color: Colors.black,
            child: const Center(
              child: Icon(Icons.image, color: Colors.white24, size: 80),
            ),
          ),

          // ACTIONS
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: const [
                Icon(Icons.favorite_border, color: Colors.white),
                SizedBox(width: 18),
                Icon(Icons.chat_bubble_outline, color: Colors.white),
                SizedBox(width: 18),
                Icon(Icons.send, color: Colors.white),
                Spacer(),
                Icon(Icons.bookmark_border, color: Colors.white),
              ],
            ),
          ),

          // CAPTION
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 14),
            child: Text(
              post.caption,
              style: const TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
