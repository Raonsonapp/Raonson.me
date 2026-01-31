import '../stories/stories_bar.dart';
import 'package:flutter/material.dart';
import 'post_card.dart';
import 'stories_bar.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Raonson')),
      body: Column(
  children: [

    // 🔵 STORIES БОЛО
    const StoriesBar(),

    // 🔽 ПОСТҲО ПОЁН
    Expanded(
      child: ListView(
        children: const [
          Text("Post 1"),
          Text("Post 2"),
          Text("Post 3"),
        ],
      ),
    ),

  ],
)
