import 'dart:convert';
import 'package:flutter/material.dart';
import '../../core/http_service.dart';
import '../../core/session.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  List reels = [];
  bool loading = true;
  String me = '';

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    me = await Session.username() ?? '';
    await _loadReels();
  }

  Future<void> _loadReels() async {
    final res = await HttpService.get('/posts');
    reels = jsonDecode(res.body);
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: reels.length,
              itemBuilder: (_, i) => _reelItem(reels[i]),
            ),
    );
  }

  // ================= REEL ITEM =================
  Widget _reelItem(dynamic reel) {
    return Stack(
      children: [
        _videoPlaceholder(),
        _rightActions(reel),
        _bottomInfo(reel),
      ],
    );
  }

  // ================= VIDEO =================
  Widget _videoPlaceholder() {
    return Container(
      color: Colors.black,
      child: const Center(
        child: Icon(
          Icons.play_arrow,
          size: 100,
          color: Colors.white24,
        ),
      ),
    );
  }

  // ================= RIGHT ACTIONS =================
  Widget _rightActions(dynamic reel) {
    return Positioned(
      right: 12,
      bottom: 120,
      child: Column(
        children: [
          _actionButton(
            icon: Icons.favorite_border,
            label: 'Like',
            onTap: () async {
              await HttpService.post('/posts/${reel['id']}/like', {});
            },
          ),
          const SizedBox(height: 18),
          _actionButton(
            icon: Icons.comment,
            label: 'Comment',
            onTap: () {},
          ),
          const SizedBox(height: 18),
          _actionButton(
            icon: Icons.send,
            label: 'Share',
            onTap: () {},
          ),
          const SizedBox(height: 18),
          _actionButton(
            icon: Icons.bookmark_border,
            label: 'Save',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 30, color: Colors.white),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }

  // ================= BOTTOM INFO =================
  Widget _bottomInfo(dynamic reel) {
    return Positioned(
      left: 12,
      bottom: 24,
      right: 80,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _userRow(reel),
          const SizedBox(height: 8),
          Text(
            reel['caption'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          _musicRow(),
        ],
      ),
    );
  }

  Widget _userRow(dynamic reel) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 16,
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.person, size: 18),
        ),
        const SizedBox(width: 8),
        Text(
          reel['username'],
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 12),
        _followBtn(reel['username']),
      ],
    );
  }

  Widget _followBtn(String user) {
    if (user == me) {
      return const SizedBox();
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white),
      ),
      child: const Text(
        'Follow',
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }

  Widget _musicRow() {
    return Row(
      children: const [
        Icon(Icons.music_note, size: 16, color: Colors.white),
        SizedBox(width: 6),
        Text(
          'Original sound • Raonson',
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}
