import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelPlayer extends StatefulWidget {
  final String url;
  const ReelPlayer({super.key, required this.url});

  @override
  State<ReelPlayer> createState() => _ReelPlayerState();
}

class _ReelPlayerState extends State<ReelPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: () {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            },
            child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _controller.value.size.width,
                  height: _controller.value.size.height,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
