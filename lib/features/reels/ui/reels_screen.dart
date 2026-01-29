import 'package:flutter/material.dart';
import '../data/reel_model.dart';
import 'reel_player.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reels = List.generate(
      6,
      (i) => ReelModel(
        videoUrl: 'video_$i.mp4',
        userName: 'reel_user_$i',
        caption: '🔥 Reel caption number $i',
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: reels.length,
        itemBuilder: (context, index) {
          return ReelPlayer(reel: reels[index]);
        },
      ),
    );
  }
}
