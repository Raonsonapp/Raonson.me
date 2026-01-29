import 'package:flutter/material.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        controller: _controller,
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return _reelItem();
        },
      ),
    );
  }

  Widget _reelItem() {
    return Stack(
      children: [
        // 🎥 Video placeholder
        Container(
          color: Colors.black,
          child: const Center(
            child: Icon(
              Icons.play_arrow,
              size: 80,
              color: Colors.white38,
            ),
          ),
        ),

        // 🔝 Top bar
        Positioned(
          top: 50,
          left: 16,
          child: Row(
            children: const [
              Text(
                'Reels',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        // ❤️ Right actions
        Positioned(
          right: 12,
          bottom: 120,
          child: Column(
            children: [
              _action(Icons.favorite_border, '12.3K'),
              _action(Icons.comment, '430'),
              _action(Icons.send, 'Share'),
              const SizedBox(height: 12),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: const Icon(Icons.person),
              ),
            ],
          ),
        ),

        // 📝 Bottom info
        Positioned(
          left: 16,
          bottom: 40,
          right: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '@raonson_user',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'This is a reels caption #raonson #reels',
                style: TextStyle(color: Colors.white),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _action(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 30),
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
