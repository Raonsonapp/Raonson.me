import 'package:flutter/material.dart';
import '../data/reel_model.dart';
import 'reel_player.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reels = [
      ReelModel(
        videoUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        userName: 'raonson',
        caption: '🔥 Raonson Reels',
        avatar: 'https://i.pravatar.cc/150?img=5',
        likes: 1200,
        comments: 87,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: reels.length,
        itemBuilder: (_, i) => ReelPlayer(reel: reels[i]),
      ),
    );
  }
}
