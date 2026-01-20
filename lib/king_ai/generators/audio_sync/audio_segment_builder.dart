import 'voice_profile.dart';
import 'lip_sync_mapper.dart';

class AudioSegmentBuilder {
  final LipSyncMapper mapper = LipSyncMapper();

  Map<String, dynamic> buildSegment({
    required String text,
    required VoiceProfile voice,
    required int frameStart,
    required int frameEnd,
  }) {
    return {
      "voice": voice.toMap(),
      "sync": mapper.map(
        audioText: text,
        frameStart: frameStart,
        frameEnd: frameEnd,
      ),
    };
  }
}