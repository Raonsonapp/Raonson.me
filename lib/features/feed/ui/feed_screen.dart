import 'package:flutter/material.dart';
import '../logic/feed_controller.dart';
import 'post_card.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final controller = FeedController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Raonson Feed")),
      body: AnimatedBuilder(
        animation: controller,
        builder: (_, __) => ListView(
          children: controller.posts
              .map((p) => PostCard(post: p, controller: controller))
              .toList(),
        ),
      ),
    );
  }
}
