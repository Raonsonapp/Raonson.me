import 'package:flutter/material.dart';
import '../stories/stories_bar.dart';
import 'post_card.dart';

class HomeFeed extends StatelessWidget {
  const HomeFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const StoriesBar();
        }
        return const PostCard();
      },
    );
  }
}
