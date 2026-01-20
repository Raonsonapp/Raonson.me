import '../core/voice_clip.dart';

class TTSEngine {
  Future<void> speak(VoiceClip clip) async {
    // Placeholder: cloud / local TTS later
    await Future.delayed(const Duration(milliseconds: 100));
  }
}