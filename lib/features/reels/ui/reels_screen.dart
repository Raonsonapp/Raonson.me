import 'package:flutter/material.dart';
import '../data/reel_model.dart';
import 'reel_item.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reels = List.generate(
      6,
      (i) => ReelModel(
        id: '$i',
        username: 'reel_user$i',
        userAvatar: 'https://i.pravatar.cc/150?img=${i + 20}',
        mediaUrl: 'https://picsum.photos/600/1000?random=$i',
        caption: '🔥 Reel caption number $i',
        likes: 500 + i * 13,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: reels.length,
        itemBuilder: (_, index) {
          return ReelItem(reel: reels[index]);
        },
      ),
    );
  }
}
