import 'package:flutter/material.dart';

class StoryAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isViewed;

  const StoryAvatar({
    super.key,
    required this.imageUrl,
    this.isViewed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: isViewed
            ? null
            : const LinearGradient(
                colors: [Colors.purple, Colors.red, Colors.orange],
              ),
      ),
      child: CircleAvatar(
        radius: 32,
        backgroundImage: NetworkImage(imageUrl),
      ),
    );
  }
}
