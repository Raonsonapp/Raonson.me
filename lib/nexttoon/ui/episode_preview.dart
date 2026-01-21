import 'package:flutter/material.dart';
import '../models/anime_episode.dart';
import '../models/anime_scene.dart';

class EpisodePreview extends StatelessWidget {
  final AnimeEpisode episode;

  const EpisodePreview({
    super.key,
    required this.episode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(episode.title),
      ),
      body: ListView.builder(
        itemCount: episode.scenes.length,
        itemBuilder: (context, index) {
          final AnimeScene scene = episode.scenes[index];

          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Scene ${scene.index + 1}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    scene.description,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.timer, size: 16),
                      const SizedBox(width: 6),
                      Text('${scene.durationSeconds} sec'),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}