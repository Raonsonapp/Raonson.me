import 'audio_segment_builder.dart';
import 'voice_profile.dart';

class AudioTrackComposer {
  final AudioSegmentBuilder builder = AudioSegmentBuilder();

  List<Map<String, dynamic>> compose({
    required List<String> scriptLines,
    required VoiceProfile voice,
  }) {
    int frame = 1;
    return scriptLines.map((line) {
      final segment = builder.buildSegment(
        text: line,
        voice: voice,
        frameStart: frame,
        frameEnd: frame + 24,
      );
      frame += 25;
      return segment;
    }).toList();
  }
}