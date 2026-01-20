import '../core/voice_profile.dart';
import '../core/voice_track.dart';
import 'tts_engine.dart';
import 'emotion_mapper.dart';

class DubbingService {
  Future<VoiceTrack> dub({
    required String text,
    required VoiceProfile profile,
    required String language,
  }) async {
    final emotion = EmotionMapper().detect(text);
    final path = await TTSEngine().synthesize(
      text: text,
      language: language,
      emotion: emotion,
    );

    return VoiceTrack(
      audioPath: path,
      duration: text.length / 10,
      language: language,
    );
  }
}