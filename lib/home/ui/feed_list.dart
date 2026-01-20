import 'package:flutter/material.dart';
import '../state/feed_controller.dart';
import 'feed_card.dart';

class FeedList extends StatelessWidget {
  final FeedController controller;
  const FeedList({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return ListView.builder(
          itemCount: controller.state.items.length,
          itemBuilder: (_, i) =>
              FeedCard(item: controller.state.items[i]),
        );
      },
    );
  }
}