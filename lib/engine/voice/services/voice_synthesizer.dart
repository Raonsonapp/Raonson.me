import '../core/voice_line.dart';
import '../voice_engine.dart';

class VoiceSynthesizer {
  Future<VoiceResult> generate({
    required List<VoiceLine> lines,
    required String languageCode,
  }) async {
    int totalMs = 0;
    List<String> audio = [];

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];
      totalMs += line.estimatedDurationMs;

      // Placeholder audio file (later real AI voices)
      audio.add(
        "voice_${line.characterId}_${i}_$languageCode.wav",
      );
    }

    return VoiceResult(
      audioFiles: audio,
      totalDurationMs: totalMs,
    );
  }
}