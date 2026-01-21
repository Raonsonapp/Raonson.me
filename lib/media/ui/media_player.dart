// media/ui/media_player.dart

import 'package:flutter/material.dart';
import '../services/media_player_service.dart';

class MediaPlayer extends StatefulWidget {
  final String title;

  const MediaPlayer({super.key, required this.title});

  @override
  State<MediaPlayer> createState() => _MediaPlayerState();
}

class _MediaPlayerState extends State<MediaPlayer> {
  final MediaPlayerService _player = MediaPlayerService();
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();
    _player.play((pos) {
      setState(() => _position = pos);
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),

        Container(
          height: 200,
          color: Colors.black,
          child: const Center(
            child: Icon(Icons.play_circle, color: Colors.white, size: 64),
          ),
        ),

        const SizedBox(height: 12),

        Text(
          'Position: ${_position.inSeconds}s',
          style: const TextStyle(color: Colors.grey),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.pause),
              onPressed: _player.pause,
            ),
            IconButton(
              icon: const Icon(Icons.play_arrow),
              onPressed: () {
                _player.play((pos) {
                  setState(() => _position = pos);
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
