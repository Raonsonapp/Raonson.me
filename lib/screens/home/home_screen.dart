import 'package:flutter/material.dart';
import '../../core/session.dart';
import '../../services/post_service.dart';
import '../../services/post_actions_service.dart';
import '../create/create_post_screen.dart';
import '../comments/comments_screen.dart';
import 'widgets/stories_bar.dart';

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
    _me = await Session.username() ?? '';
    await _loadPosts();
  }

  Future<void> _loadPosts() async {
    try {
      final data = await PostService.getAll();
      setState(() {
        _posts = data;
        _loading = false;
      });
    } catch (_) {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F1424),
      appBar: _appBar(),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _loadPosts,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: _posts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // ===== STORIES BAR =====
                    return const StoriesBar();
                  }
                  return _postCard(_posts[index - 1]);
                },
              ),
            ),
    );
  }

  // ================= APP BAR =================
  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0F1424),
      elevation: 0,
      title: const Text(
        'Raonson',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.add_box_outlined, size: 26),
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
          icon: const Icon(Icons.smart_toy, size: 26), // Jarvis
          onPressed: () {
            // future AI / Jarvis screen
          },
        ),
      ],
    );
  }

  // ================= POST CARD =================
  Widget _postCard(dynamic post) {
    final int postId = post['id'] is int
    ? post['id']
    : int.parse(post['id'].toString());
    final String username = post['username'] ?? '';
    final String caption = post['caption'] ?? '';
    final String imageUrl = post['image_url'] ?? '';
    final int likes = post['likes'] ?? 0;
    final bool liked = post['liked'] ?? false;
    final bool saved = post['saved'] ?? false;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      color: const Color(0xFF0F1424),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ===== HEADER =====
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(Icons.person, color: Colors.white),
            ),
            title: Text(
              username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: const Icon(Icons.more_vert),
          ),

          // ===== IMAGE =====
          if (imageUrl.isNotEmpty)
            Image.network(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const SizedBox(
                height: 260,
                child: Center(child: Icon(Icons.broken_image)),
              ),
            ),

          // ===== ACTIONS =====
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    liked ? Icons.favorite : Icons.favorite_border,
                    color: liked ? Colors.red : Colors.white,
                  ),
                  onPressed: () async {
                    if (liked) {
                      await PostActionsService.unlike(postId, _me);
                    } else {
                      await PostActionsService.like(postId, _me);
                    }
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
                  onPressed: () {
                    // system share (баъд)
                  },
                ),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    saved ? Icons.bookmark : Icons.bookmark_border,
                  ),
                  onPressed: () async {
                    if (saved) {
                      await PostActionsService.unsave(postId, _me);
                    } else {
                      await PostActionsService.save(postId, _me);
                    }
                    _loadPosts();
                  },
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
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
