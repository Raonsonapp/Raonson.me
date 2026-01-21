import 'voice_track.dart';
import 'lip_sync_engine.dart';

class AudioPipeline {
  final List<VoiceTrack> tracks = [];
  final LipSyncEngine lipSync = LipSyncEngine();

  void addTrack(VoiceTrack track) {
    tracks.add(track);
  }

  void process() {
    for (final track in tracks) {
      lipSync.generate(track.audioPath);
    }
  }
}
