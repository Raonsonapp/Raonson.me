import 'package:flutter/material.dart';
import '../../models/post.dart';
import '../../core/api.dart';
import '../../core/http_client.dart';
import '../../models/post.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  List<Post> reels = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadReels();
  }

  Future<void> loadReels() async {
    final data = await HttpClient.get(
      '${ApiConfig.baseUrl}/posts',
    );

    setState(() {
      reels = data.map<Post>((e) => Post.fromJson(e)).toList();
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: reels.length,
        itemBuilder: (context, index) {
          return _ReelItem(post: reels[index]);
        },
      ),
    );
  }
}

class _ReelItem extends StatelessWidget {
  final Post post;
  const _ReelItem({required this.post});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // VIDEO PLACEHOLDER (SERVER-READY)
        Container(
          color: Colors.black,
          child: const Center(
            child: Icon(
              Icons.play_circle_outline,
              size: 100,
              color: Colors.white24,
            ),
          ),
        ),

        // RIGHT ACTIONS (DESIGN FROM YOUR IMAGES)
        Positioned(
          right: 14,
          bottom: 120,
          child: Column(
            children: const [
              _ReelAction(icon: Icons.favorite_border, label: '1.2K'),
              SizedBox(height: 22),
              _ReelAction(icon: Icons.chat_bubble_outline, label: '340'),
              SizedBox(height: 22),
              _ReelAction(icon: Icons.send, label: 'Share'),
              SizedBox(height: 22),
              _ReelAction(icon: Icons.bookmark_border, label: 'Save'),
            ],
          ),
        ),

        // USER + CAPTION (BOTTOM LEFT)
        Positioned(
          left: 14,
          bottom: 30,
          right: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.person, size: 16, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    post.username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                post.caption,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ReelAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ReelAction({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.35),
                blurRadius: 14,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 32),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}
