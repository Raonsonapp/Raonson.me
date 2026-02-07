import 'package:flutter/material.dart';

/// ===============================
/// REELS SCREEN – RAONSON v2
/// Fullscreen vertical reels
/// ===============================

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final PageController _pageController = PageController();

  final List<_ReelData> reels = List.generate(
    6,
    (i) => _ReelData(
      username: 'reel_user$i',
      caption: 'This is Raonson reel caption number $i',
      likes: 3400 + i * 211,
    ),
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: reels.length,
        itemBuilder: (context, index) {
          return _ReelItem(
            data: reels[index],
          );
        },
      ),
    );
  }
}

/// ===============================
/// SINGLE REEL ITEM
/// ===============================
class _ReelItem extends StatefulWidget {
  final _ReelData data;

  const _ReelItem({required this.data});

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
        _topOverlay(),
      ],
    );
  }

  // -------------------------------
  // VIDEO PLACEHOLDER
  // -------------------------------
  Widget _videoPlaceholder() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: const Center(
        child: Icon(
          Icons.play_arrow,
          size: 90,
          color: Colors.white24,
        ),
      ),
    );
  }

  // -------------------------------
  // RIGHT ACTIONS (LIKE, COMMENT...)
  // -------------------------------
  Widget _rightActions() {
    return Positioned(
      right: 12,
      bottom: 120,
      child: Column(
        children: [
          _actionButton(
            icon: liked ? Icons.favorite : Icons.favorite_border,
            color: liked ? Colors.redAccent : Colors.white,
            label: widget.data.likes.toString(),
            onTap: () {
              setState(() {
                liked = !liked;
                widget.data.likes += liked ? 1 : -1;
              });
            },
          ),
          const SizedBox(height: 20),
          _actionButton(
            icon: Icons.chat_bubble_outline,
            label: 'Comment',
            onTap: () {
              _openComments(context);
            },
          ),
          const SizedBox(height: 20),
          _actionButton(
            icon: Icons.send,
            label: 'Share',
            onTap: () {},
          ),
          const SizedBox(height: 20),
          _actionButton(
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

  Widget _actionButton({
    required IconData icon,
    required String label,
    Color color = Colors.white,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  // -------------------------------
  // BOTTOM INFO (USERNAME, CAPTION)
  // -------------------------------
  Widget _bottomInfo() {
    return Positioned(
      left: 12,
      right: 80,
      bottom: 30,
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
                widget.data.username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            widget.data.caption,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  // -------------------------------
  // TOP OVERLAY (OPTIONAL)
  // -------------------------------
  Widget _topOverlay() {
    return Positioned(
      top: 40,
      left: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.black54,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          'Reels',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  // -------------------------------
  // COMMENTS (BOTTOM SHEET)
  // -------------------------------
  void _openComments(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF0B0F1A),
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            height: 360,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'Comments',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return const ListTile(
                        leading: CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text('user'),
                        subtitle: Text('Nice reel 🔥'),
                      );
                    },
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Add a comment...',
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// ===============================
/// REEL DATA MODEL
/// ===============================
class _ReelData {
  final String username;
  final String caption;
  int likes;

  _ReelData({
    required this.username,
    required this.caption,
    required this.likes,
  });
}
