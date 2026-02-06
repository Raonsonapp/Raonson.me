import 'package:flutter/material.dart';
import '../services/reels_service.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  late Future<List<dynamic>> _reelsFuture;

  @override
  void initState() {
    super.initState();
    _reelsFuture = ReelsService.getReels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<List<dynamic>>(
        future: _reelsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Failed to load reels',
                  style: TextStyle(color: Colors.white70)),
            );
          }

          final reels = snapshot.data ?? [];
          if (reels.isEmpty) {
            return const Center(
              child: Text('No reels yet',
                  style: TextStyle(color: Colors.white70)),
            );
          }

          return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: reels.length,
            onPageChanged: (index) {
              final reel = reels[index];
              ReelsService.addView(reel['id']);
            },
            itemBuilder: (context, index) {
              final reel = reels[index];
              return ReelItem(
                reelId: reel['id'],
                imageUrl: reel['cover_url'] ?? '',
                username: reel['username'] ?? 'user',
                caption: reel['caption'] ?? '',
              );
            },
          );
        },
      ),
    );
  }
}

class ReelItem extends StatefulWidget {
  final int reelId;
  final String imageUrl;
  final String username;
  final String caption;

  const ReelItem({
    super.key,
    required this.reelId,
    required this.imageUrl,
    required this.username,
    required this.caption,
  });

  @override
  State<ReelItem> createState() => _ReelItemState();
}

class _ReelItemState extends State<ReelItem> {
  bool liked = false;
  bool liking = false;

  Future<void> _like() async {
    if (liking) return;
    setState(() {
      liked = true;
      liking = true;
    });
    try {
      await ReelsService.likeReel(widget.reelId);
    } catch (_) {
      setState(() => liked = false);
    } finally {
      liking = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: widget.imageUrl.isNotEmpty
              ? Image.network(widget.imageUrl, fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _placeholder())
              : _placeholder(),
        ),

        // overlay
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black38, Colors.transparent, Colors.black87],
              ),
            ),
          ),
        ),

        // right actions
        Positioned(
          right: 12,
          bottom: 120,
          child: Column(
            children: [
              GestureDetector(
                onTap: _like,
                child: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  color: liked ? Colors.pinkAccent : Colors.white,
                  size: 34,
                ),
              ),
              const SizedBox(height: 20),
              const Icon(Icons.chat_bubble_outline, size: 30),
              const SizedBox(height: 20),
              const Icon(Icons.send, size: 30),
              const SizedBox(height: 20),
              const Icon(Icons.bookmark_border, size: 30),
            ],
          ),
        ),

        // bottom info
        Positioned(
          left: 12,
          bottom: 28,
          right: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage:
                        NetworkImage('https://i.pravatar.cc/150'),
                  ),
                  const SizedBox(width: 8),
                  Text(widget.username,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              Text(widget.caption,
                  style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _placeholder() {
    return Container(
      color: Colors.black26,
      child: const Center(
        child: Icon(Icons.play_circle_outline,
            size: 64, color: Colors.white54),
      ),
    );
  }
}
