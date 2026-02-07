import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../core/session.dart';
import '../../services/post_service.dart';
import '../../services/post_actions_service.dart';
import '../comments/comments_screen.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final PageController _pageCtrl = PageController();
  List<dynamic> _reels = [];
  bool _loading = true;
  String _me = '';
  final Map<int, VideoPlayerController> _controllers = {};

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    _me = await Session.username() ?? '';
    await _loadReels();
  }

  Future<void> _loadReels() async {
    try {
      final data = await PostService.getReels();
      _reels = data;
      _initController(0);
      setState(() => _loading = false);
    } catch (_) {
      setState(() => _loading = false);
    }
  }

  void _initController(int index) {
    if (index < 0 || index >= _reels.length) return;
    if (_controllers.containsKey(index)) return;

    final url = _reels[index]['video_url'];
    if (url == null || url.isEmpty) return;

    final ctrl = VideoPlayerController.networkUrl(Uri.parse(url));
    ctrl.initialize().then((_) {
      ctrl.setLooping(true);
      ctrl.play();
      setState(() {});
    });
    _controllers[index] = ctrl;
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : PageView.builder(
              controller: _pageCtrl,
              scrollDirection: Axis.vertical,
              itemCount: _reels.length,
              onPageChanged: (i) {
                _initController(i);
                _controllers.forEach((k, v) {
                  if (k == i) {
                    v.play();
                  } else {
                    v.pause();
                  }
                });
              },
              itemBuilder: (context, index) {
                return _reelItem(index);
              },
            ),
    );
  }

  // ================= SINGLE REEL =================
  Widget _reelItem(int index) {
    final reel = _reels[index];
    final String postId = reel['id'].toString();
    final String username = reel['username'] ?? '';
    final String bio = reel['bio'] ?? '';
    final String videoUrl = reel['video_url'] ?? '';
    final bool liked = reel['liked'] ?? false;
    final bool saved = reel['saved'] ?? false;
    final int likes = reel['likes'] ?? 0;

    final ctrl = _controllers[index];

    return Stack(
      children: [
        // ===== VIDEO =====
        Positioned.fill(
          child: ctrl != null && ctrl.value.isInitialized
              ? VideoPlayer(ctrl)
              : const Center(child: CircularProgressIndicator()),
        ),

        // ===== RIGHT ACTIONS =====
        Positioned(
          right: 10,
          bottom: 120,
          child: Column(
            children: [
              _actionBtn(
                icon: liked ? Icons.favorite : Icons.favorite_border,
                color: liked ? Colors.red : Colors.white,
                label: likes.toString(),
                onTap: () async {
                  if (liked) {
                    await PostActionsService.unlike(postId, _me);
                  } else {
                    await PostActionsService.like(postId, _me);
                  }
                  _loadReels();
                },
              ),
              const SizedBox(height: 18),
              _actionBtn(
                icon: Icons.mode_comment_outlined,
                label: 'Comment',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CommentsScreen(postId: postId),
                    ),
                  );
                },
              ),
              const SizedBox(height: 18),
              _actionBtn(
                icon: Icons.send,
                label: 'Share',
                onTap: () {},
              ),
              const SizedBox(height: 18),
              _actionBtn(
                icon: saved ? Icons.bookmark : Icons.bookmark_border,
                label: 'Save',
                onTap: () async {
                  if (saved) {
                    await PostActionsService.unsave(postId, _me);
                  } else {
                    await PostActionsService.save(postId, _me);
                  }
                  _loadReels();
                },
              ),
            ],
          ),
        ),

        // ===== USER INFO (BOTTOM LEFT) =====
        Positioned(
          left: 12,
          bottom: 30,
          right: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white24,
                    child: Icon(Icons.person, size: 16),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    username,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              if (bio.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    bio,
                    style: const TextStyle(color: Colors.white70),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  // ================= ACTION BUTTON =================
  Widget _actionBtn({
    required IconData icon,
    Color color = Colors.white,
    required String label,
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
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
