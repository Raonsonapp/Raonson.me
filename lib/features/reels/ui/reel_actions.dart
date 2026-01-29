import 'package:flutter/material.dart';
import '../data/reel_model.dart';

class ReelActions extends StatelessWidget {
  final ReelModel reel;
  const ReelActions({super.key, required this.reel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _icon(Icons.favorite, reel.likes.toString()),
        const SizedBox(height: 16),
        _icon(Icons.chat_bubble, reel.comments.toString()),
        const SizedBox(height: 16),
        _icon(Icons.send, 'Share'),
        const SizedBox(height: 16),
        _icon(Icons.more_vert, ''),
      ],
    );
  }

  Widget _icon(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 32),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
