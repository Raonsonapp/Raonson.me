import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/http_service.dart';
import '../../services/post_service.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  bool _loading = true;
  List<dynamic> _reels = [];
  final Set<int> _saved = {};

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
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
              itemBuilder: (_, i) => _item(_reels[i]),
            ),
    );
  }

  Widget _item(dynamic p) {
    final int id = p['id'];
    final String u = p['username'] ?? '';
    final String c = p['caption'] ?? '';
    final String img = p['image_url'] ?? '';
    final int likes = p['likes'] ?? 0;

    final bool isSaved = _saved.contains(id);

    return Stack(
      fit: StackFit.expand,
      children: [
        img.isNotEmpty
            ? Image.network(img, fit: BoxFit.cover)
            : const ColoredBox(color: Colors.black),

        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black54, Colors.transparent],
            ),
          ),
        ),

        Positioned(
          left: 12,
          bottom: 24,
          right: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('@$u',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 6),
              Text(c, maxLines: 3, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),

        Positioned(
          right: 12,
          bottom: 60,
          child: Column(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_border, size: 28),
                onPressed: () async {
                  await PostService.like(id);
                  _load();
                },
              ),
              Text('$likes'),
              const SizedBox(height: 18),
              const Icon(Icons.mode_comment_outlined, size: 28),
              const SizedBox(height: 18),
              const Icon(Icons.send, size: 28),
              const SizedBox(height: 18),
              IconButton(
                icon: Icon(
                  isSaved ? Icons.bookmark : Icons.bookmark_border,
                  size: 28,
                ),
                onPressed: () {
                  setState(() {
                    if (isSaved) {
                      _saved.remove(id);
                    } else {
                      _saved.add(id);
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
