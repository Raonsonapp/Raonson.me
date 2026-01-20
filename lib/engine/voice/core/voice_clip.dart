import 'voice_profile.dart';
import 'emotion_profile.dart';

class VoiceClip {
  final String text;
  final VoiceProfile voice;
  final EmotionProfile emotion;
  final double speed;
  final double pitch;

  VoiceClip({
    required this.text,
    required this.voice,
    required this.emotion,
    this.speed = 1.0,
    this.pitch = 1.0,
  });
}
