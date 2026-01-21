import 'timeline_track.dart';

class TimelineMaster {
  final List<TimelineTrack> tracks;

  TimelineMaster(this.tracks);

  Duration get totalDuration {
    return tracks.fold(
      Duration.zero,
      (max, t) => t.duration > max ? t.duration : max,
    );
  }
}