import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  List reels = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchReels();
  }

  Future<void> fetchReels() async {
    try {
      final res = await http.get(
        Uri.parse('https://raonson-me.onrender.com/posts'),
      );

      if (res.statusCode == 200) {
        setState(() {
          reels = jsonDecode(res.body);
          loading = false;
        });
      } else {
        setState(() => loading = false);
      }
    } catch (_) {
      setState(() => loading = false);
    }
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
              itemBuilder: (context, index) {
                final reel = reels[index];
                return _ReelItem(reel: reel);
              },
            ),
    );
  }
}

class _ReelItem extends StatelessWidget {
  final Map reel;

  const _ReelItem({required this.reel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ===== VIDEO PLACEHOLDER =====
        Container(
          color: Colors.black,
          child: const Center(
            child: Icon(
              Icons.play_circle_outline,
              size: 90,
              color: Colors.white24,
            ),
          ),
        ),

        // ===== RIGHT ACTIONS =====
        Positioned(
          right: 12,
          bottom: 120,
          child: Column(
            children: const [
              _ReelIcon(icon: Icons.favorite_border, label: '1.2K'),
              SizedBox(height: 20),
              _ReelIcon(icon: Icons.chat_bubble_outline, label: '340'),
              SizedBox(height: 20),
              _ReelIcon(icon: Icons.send, label: 'Share'),
              SizedBox(height: 20),
              _ReelIcon(icon: Icons.bookmark_border, label: 'Save'),
            ],
          ),
        ),

        // ===== USER INFO =====
        Positioned(
          left: 12,
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
                    child: Icon(Icons.person, color: Colors.white, size: 16),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    reel['username'] ?? 'user',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                reel['caption'] ?? '',
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

class _ReelIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ReelIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.blue.withOpacity(0.25),
                blurRadius: 12,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(icon, color: Colors.white, size: 30),
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
