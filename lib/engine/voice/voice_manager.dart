import 'core/voice_clip.dart';
import 'services/tts_engine.dart';

class VoiceManager {
  VoiceManager._();
  static final VoiceManager instance = VoiceManager._();

  Future<void> play(VoiceClip clip) async {
    await TTSEngine().speak(clip);
  }
}