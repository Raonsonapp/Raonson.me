import 'core/voice_line.dart';
import 'services/voice_synthesizer.dart';

class VoiceEngine {
  VoiceEngine._();
  static final VoiceEngine instance = VoiceEngine._();

  Future<VoiceResult> synthesize({
    required List<VoiceLine> lines,
    required String languageCode,
  }) async {
    return VoiceSynthesizer().generate(
      lines: lines,
      languageCode: languageCode,
    );
  }
}

class VoiceResult {
  final List<String> audioFiles;
  final int totalDurationMs;

  VoiceResult({
    required this.audioFiles,
    required this.totalDurationMs,
  });
}