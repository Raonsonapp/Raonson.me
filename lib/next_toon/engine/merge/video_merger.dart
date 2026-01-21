import 'merge_timeline.dart';

class VideoMerger {
  bool isMerging = false;
  double progress = 0.0;

  Future<String> merge(MergeTimeline timeline) async {
    isMerging = true;
    progress = 0.0;

    // Fake merge simulation
    for (int i = 0; i < timeline.clips.length; i++) {
      await Future.delayed(const Duration(milliseconds: 400));
      progress = (i + 1) / timeline.clips.length;
    }

    isMerging = false;

    // Path of final episode video
    return '/storage/emulated/0/NextToon/episode_final.mp4';
  }
}