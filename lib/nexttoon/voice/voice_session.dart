import 'dub_track.dart';

class VoiceSession {
  final String sessionId;
  final List<DubTrack> tracks;

  VoiceSession({
    required this.sessionId,
    required this.tracks,
  });
}