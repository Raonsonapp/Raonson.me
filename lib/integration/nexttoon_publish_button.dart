import 'package:flutter/material.dart';
import '../../integration/nexttoon_publish_service.dart';
import '../../models/episode_model.dart';

class NextToonPublishButton extends StatelessWidget {
  final EpisodeModel episode;

  const NextToonPublishButton({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.public),
      label: const Text("Publish to Raonson"),
      onPressed: () async {
        await NextToonPublishService().publishEpisode(episode);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Episode published")),
        );
      },
    );
  }
}