import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return _reelItem(index);
        },
      ),
    );
  }

  Widget _reelItem(int index) {
    return Stack(
      children: [
        // -------- VIDEO PLACEHOLDER --------
        Container(
          color: Colors.black,
          child: const Center(
            child: Icon(
              Icons.play_arrow,
              size: 100,
              color: Colors.white24,
            ),
          ),
        ),

        // -------- RIGHT ACTIONS --------
        Positioned(
          right: 12,
          bottom: 100,
          child: Column(
            children: const [
              _ReelAction(icon: Icons.favorite_border, label: '12k'),
              SizedBox(height: 18),
              _ReelAction(icon: Icons.chat_bubble_outline, label: '234'),
              SizedBox(height: 18),
              _ReelAction(icon: Icons.send, label: 'Share'),
              SizedBox(height: 18),
              _ReelAction(icon: Icons.bookmark_border, label: ''),
            ],
          ),
        ),

        // -------- USER INFO --------
        Positioned(
          left: 12,
          bottom: 24,
          right: 90,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    child: Icon(Icons.person, size: 16),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'username',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'This is reel caption ✨',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// -------- ACTION WIDGET --------
class _ReelAction extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ReelAction({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30),
        if (label.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              label,
              style: const TextStyle(fontSize: 12),
            ),
          ),
      ],
    );
  }
}
