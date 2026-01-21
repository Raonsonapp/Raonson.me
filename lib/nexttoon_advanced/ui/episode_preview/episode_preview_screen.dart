import 'package:flutter/material.dart';
import '../../render_engine/final_renderer.dart';
import '../../render_engine/render_timeline.dart';

class EpisodePreviewScreen extends StatefulWidget {
  final RenderTimeline timeline;

  const EpisodePreviewScreen({super.key, required this.timeline});

  @override
  State<EpisodePreviewScreen> createState() => _EpisodePreviewScreenState();
}

class _EpisodePreviewScreenState extends State<EpisodePreviewScreen> {
  bool rendering = false;
  String? videoPath;

  final renderer = FinalRenderer();

  Future<void> _renderEpisode() async {
    setState(() => rendering = true);
    videoPath = await renderer.render(widget.timeline);
    setState(() => rendering = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Episode Preview")),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: videoPath == null
                  ? const Text("No video rendered yet")
                  : Text("Video ready: $videoPath"),
            ),
          ),
          rendering
              ? const Padding(
                  padding: EdgeInsets.all(16),
                  child: CircularProgressIndicator(),
                )
              : ElevatedButton(
                  onPressed: _renderEpisode,
                  child: const Text("Render Episode"),
                ),
        ],
      ),
    );
  }
}