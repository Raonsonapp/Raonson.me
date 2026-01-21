import 'package:flutter/material.dart';
import '../../models/episode_model.dart';
import 'nexttoon_publish_button.dart';

class NextToonPublishScreen extends StatelessWidget {
  final EpisodeModel episode;

  const NextToonPublishScreen({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Publish Episode")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              episode.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            NextToonPublishButton(episode: episode),
          ],
        ),
      ),
    );
  }
}