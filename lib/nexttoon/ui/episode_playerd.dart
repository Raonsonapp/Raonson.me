import 'dart:async';
import 'package:flutter/material.dart';
import '../models/anime_episode.dart';
import '../models/anime_scene.dart';

class EpisodePlayer extends StatefulWidget {
  final AnimeEpisode episode;

  const EpisodePlayer({
    super.key,
    required this.episode,
  });

  @override
  State<EpisodePlayer> createState() => _EpisodePlayerState();
}

class _EpisodePlayerState extends State<EpisodePlayer> {
  int _currentSceneIndex = 0;
  Timer? _sceneTimer;

  AnimeScene get _currentScene =>
      widget.episode.scenes[_currentSceneIndex];

  @override
  void initState() {
    super.initState();
    _playScene();
  }

  void _playScene() {
    _sceneTimer?.cancel();

    _sceneTimer = Timer(
      Duration(seconds: _currentScene.durationSeconds),
      () {
        if (_currentSceneIndex < widget.episode.scenes.length - 1) {
          setState(() {
            _currentSceneIndex++;
          });
          _playScene();
        } else {
          _onEpisodeFinished();
        }
      },
    );
  }

  void _onEpisodeFinished() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Episode finished'),
        content: const Text('Anime episode playback completed.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _sceneTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.episode.title),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Scene ${_currentScene.index + 1}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _currentScene.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 30),
              LinearProgressIndicator(
                backgroundColor: Colors.white12,
                valueColor:
                    const AlwaysStoppedAnimation<Color>(Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}