import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final String imageUrl;
  final double size;
  final bool hasStory;
  final bool isOnline;

  const AvatarWidget({
    super.key,
    required this.imageUrl,
    this.size = 44,
    this.hasStory = false,
    this.isOnline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: hasStory ? const EdgeInsets.all(2) : EdgeInsets.zero,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: hasStory
                ? const LinearGradient(
                    colors: [Colors.pink, Colors.orange],
                  )
                : null,
          ),
          child: CircleAvatar(
            radius: size / 2,
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        if (isOnline)
          Positioned(
            bottom: 2,
            right: 2,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}
