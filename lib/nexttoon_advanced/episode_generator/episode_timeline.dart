import 'episode_scene_block.dart';

class EpisodeTimeline {
  final List<EpisodeSceneBlock> blocks = [];

  void addBlock(EpisodeSceneBlock block) {
    blocks.add(block);
    blocks.sort((a, b) => a.startAt.compareTo(b.startAt));
  }

  Duration get totalDuration {
    if (blocks.isEmpty) return Duration.zero;
    final last = blocks.last;
    return last.startAt + last.length;
  }
}