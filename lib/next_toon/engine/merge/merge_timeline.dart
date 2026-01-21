import 'merged_clip.dart';

class MergeTimeline {
  final List<MergedClip> clips;

  MergeTimeline(this.clips);

  Duration get totalDuration {
    return clips.fold(
      Duration.zero,
      (sum, clip) => sum + clip.duration,
    );
  }
}