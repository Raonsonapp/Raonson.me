import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/http_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = true;
  List<dynamic> _posts = [];

  @override
  void initState() {
    super.initState();
    _loadPosts();
  }

  Future<void> _loadPosts() async {
    try {
      final data = await HttpService.get(Api.posts);
      setState(() {
        _posts = data ?? [];
        _loading = false;
      });
    } catch (_) {
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
                itemBuilder: (c, i) => _postCard(_posts[i]),
              ),
            ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        'Raonson',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.smart_toy), // Jarvis
          onPressed: () {},
        ),
      ],
      leading: IconButton(
        icon: const Icon(Icons.add_box_outlined),
        onPressed: () {}, // Create post (қадамҳои баъдӣ)
      ),
    );
  }

  Widget _postCard(dynamic p) {
    final username = p['username'] ?? '';
    final caption = p['caption'] ?? '';
    final imageUrl = p['image_url'] ?? '';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      color: const Color(0xFF0F1424),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(username),
            trailing: const Icon(Icons.more_vert),
          ),

          // image
          if (imageUrl.isNotEmpty)
            Image.network(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  const SizedBox(height: 200, child: Center(child: Icon(Icons.broken_image))),
            ),

          // actions
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: const [
                Icon(Icons.favorite_border),
                SizedBox(width: 16),
                Icon(Icons.mode_comment_outlined),
                SizedBox(width: 16),
                Icon(Icons.send),
                Spacer(),
                Icon(Icons.bookmark_border),
              ],
            ),
          ),

          // caption
          if (caption.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Text(caption),
            ),
        ],
      ),
    );
  }
}
