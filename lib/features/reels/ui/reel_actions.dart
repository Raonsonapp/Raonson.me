import 'package:flutter/material.dart';

class ReelActions extends StatelessWidget {
  final int index;
  const ReelActions({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _icon(Icons.favorite, '1.2K'),
        const SizedBox(height: 20),
        _icon(Icons.comment, '320'),
        const SizedBox(height: 20),
        _icon(Icons.send, ''),
        const SizedBox(height: 20),
        CircleAvatar(
          radius: 18,
          backgroundImage: NetworkImage(
            'https://i.pravatar.cc/150?img=$index',
          ),
        ),
      ],
    );
  }

  Widget _icon(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 32),
        if (text.isNotEmpty)
          Text(text, style: const TextStyle(color: Colors.white)),
      ],
    );
  }
}
