import 'package:flutter/material.dart';
import 'reel_item.dart';
import '../models/reel_model.dart';

class ReelsScreen extends StatelessWidget {
  ReelsScreen({super.key});

  final List<ReelModel> reels = List.generate(
    5,
    (i) => ReelModel(
      username: 'reel_user$i',
      caption: 'This is reel number $i 🔥',
      videoUrl: '',
      avatarUrl: 'https://i.pravatar.cc/150?img=${i + 10}',
      likes: 300 + i * 10,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: reels.length,
        itemBuilder: (context, index) {
          return ReelItem(reel: reels[index]);
        },
      ),
    );
  }
}
