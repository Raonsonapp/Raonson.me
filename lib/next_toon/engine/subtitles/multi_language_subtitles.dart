import 'subtitle_track.dart';

class MultiLanguageSubtitles {
  final Map<String, SubtitleTrack> tracks;

  MultiLanguageSubtitles(this.tracks);

  SubtitleTrack? get(String lang) => tracks[lang];
}