import 'package:flutter/material.dart';
import '../../models/post_model.dart';
import '../../services/post_service.dart';

/// =======================================
/// REELS SCREEN – RAONSON v2 (FULL)
/// =======================================

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final PageController _controller = PageController();
  List<PostModel> reels = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadReels();
  }

  Future<void> _loadReels() async {
    try {
      // айни ҳол аз ҳамон posts мегирем (ба reels endpoint иваз мешавад)
      final data = await PostService.getPosts();
      setState(() {
        reels = data;
        loading = false;
      });
    } catch (e) {
      setState(() => loading = false);
    }
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
        controller: _controller,
        scrollDirection: Axis.vertical,
        itemCount: reels.length,
        itemBuilder: (context, index) {
          return _ReelItem(post: reels[index]);
        },
      ),
    );
  }
}

/// =======================================
/// SINGLE REEL ITEM
/// =======================================

class _ReelItem extends StatefulWidget {
  final PostModel post;
  const _ReelItem({required this.post});

  @override
  State<_ReelItem> createState() => _ReelItemState();
}

class _ReelItemState extends State<_ReelItem> {
  bool liked = false;
  bool saved = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _videoPlaceholder(),
        _rightActions(),
        _bottomInfo(),
      ],
    );
  }

  // -------------------------------
  // VIDEO (PLACEHOLDER)
  // -------------------------------
  Widget _videoPlaceholder() {
    return Container(
      color: Colors.black,
      child: const Center(
        child: Icon(
          Icons.play_circle_outline,
          size: 90,
          color: Colors.white30,
        ),
      ),
    );
  }

  // -------------------------------
  // RIGHT ACTIONS
  // -------------------------------
  Widget _rightActions() {
    return Positioned(
      right: 12,
      bottom: 120,
      child: Column(
        children: [
          _iconButton(
            icon: liked ? Icons.favorite : Icons.favorite_border,
            label: widget.post.likes.toString(),
            color: liked ? Colors.red : Colors.white,
            onTap: () async {
              await PostService.like(widget.post.id);
              setState(() {
                liked = !liked;
                widget.post.likes++;
              });
            },
          ),
          const SizedBox(height: 18),
          _iconButton(
            icon: Icons.chat_bubble_outline,
            label: 'Comment',
            onTap: () {},
          ),
          const SizedBox(height: 18),
          _iconButton(
            icon: Icons.send,
            label: 'Share',
            onTap: () {},
          ),
          const SizedBox(height: 18),
          _iconButton(
            icon: saved ? Icons.bookmark : Icons.bookmark_border,
            label: 'Save',
            onTap: () {
              setState(() => saved = !saved);
            },
          ),
        ],
      ),
    );
  }

  Widget _iconButton({
    required IconData icon,
    required String label,
    Color color = Colors.white,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, color: color, size: 30),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  // -------------------------------
  // BOTTOM INFO
  // -------------------------------
  Widget _bottomInfo() {
    return Positioned(
      left: 12,
      bottom: 24,
      right: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.blueAccent,
                child: Icon(Icons.person, size: 16),
              ),
              const SizedBox(width: 8),
              Text(
                widget.post.username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.post.caption,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
