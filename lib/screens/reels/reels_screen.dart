import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/http_service.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  bool _loading = true;
  List<dynamic> _reels = [];

  @override
  void initState() {
    super.initState();
    _loadReels();
  }

  Future<void> _loadReels() async {
    try {
      final data = await HttpService.get(Api.posts);
      setState(() {
        _reels = data ?? [];
        _loading = false;
      });
    } catch (_) {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: _reels.length,
              itemBuilder: (c, i) => _reelItem(_reels[i]),
            ),
    );
  }

  Widget _reelItem(dynamic p) {
    final username = p['username'] ?? '';
    final caption = p['caption'] ?? '';
    final imageUrl = p['image_url'] ?? '';

    return Stack(
      fit: StackFit.expand,
      children: [
        // media
        imageUrl.isNotEmpty
            ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    const Center(child: Icon(Icons.broken_image)),
              )
            : const ColoredBox(color: Colors.black),

        // gradient
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black54, Colors.transparent],
            ),
          ),
        ),

        // left info
        Positioned(
          left: 12,
          bottom: 24,
          right: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('@$username',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 6),
              Text(caption, maxLines: 3, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),

        // right actions
        Positioned(
          right: 12,
          bottom: 60,
          child: Column(
            children: const [
              _ReelAction(icon: Icons.favorite_border, label: 'Like'),
              SizedBox(height: 18),
              _ReelAction(icon: Icons.mode_comment_outlined, label: 'Comment'),
              SizedBox(height: 18),
              _ReelAction(icon: Icons.send, label: 'Share'),
              SizedBox(height: 18),
              _ReelAction(icon: Icons.bookmark_border, label: 'Save'),
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
        Icon(icon, size: 28),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
