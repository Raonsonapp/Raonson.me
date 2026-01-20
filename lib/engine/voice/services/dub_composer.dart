import '../core/voice_clip.dart';
import 'emotion_mapper.dart';

class DubComposer {
  VoiceClip compose({
    required String text,
    required voice,
    required emotion,
  }) {
    EmotionMapper().mapEmotion(emotion);
    return VoiceClip(
      text: text,
      voice: voice,
      emotion: emotion,
    );
  }
}
