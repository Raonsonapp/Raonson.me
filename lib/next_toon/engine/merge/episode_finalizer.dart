import '../render/render_queue.dart';
import 'merged_clip.dart';
import 'merge_timeline.dart';
import 'video_merger.dart';

class EpisodeFinalizer {
  final RenderQueue renderQueue;
  final VideoMerger merger = VideoMerger();

  EpisodeFinalizer(this.renderQueue);

  Future<String> finalizeEpisode() async {
    final clips = renderQueue.allJobs.map((job) {
      return MergedClip(
        shotId: job.shotId,
        videoPath: '/fake/path/${job.shotId}.mp4',
        duration: const Duration(seconds: 6),
      );
    }).toList();

    final timeline = MergeTimeline(clips);
    return await merger.merge(timeline);
  }
}
