import 'package:flutter/material.dart';
import '../../models/post.dart';
import '../../services/post_service.dart';
import 'add_post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Post> posts = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    posts = await PostService.fetchPosts();
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.add_box_outlined),
          onPressed: () async {
            final r = await Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AddPostScreen()),
            );
            if (r == true) load();
          },
        ),
        title: const Text('Raonson'),
        actions: const [
          Icon(Icons.smart_toy_outlined),
          SizedBox(width: 12),
        ],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (_, i) => _PostCard(posts[i]),
            ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final Post post;
  const _PostCard(this.post);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: const CircleAvatar(child: Text('U')),
          title: Text(post.username,
              style: const TextStyle(color: Colors.white)),
        ),
        Image.network(post.imageUrl, fit: BoxFit.cover),
        Row(
          children: const [
            Icon(Icons.favorite_border, color: Colors.white),
            SizedBox(width: 12),
            Icon(Icons.chat_bubble_outline, color: Colors.white),
            Spacer(),
            Icon(Icons.bookmark_border, color: Colors.white),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            post.caption,
            style: const TextStyle(color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
