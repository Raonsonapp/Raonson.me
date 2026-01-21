import 'voice_emotion.dart';

class VoiceLine {
  final String text;
  final VoiceEmotion emotion;
  final Duration duration;

  VoiceLine({
    required this.text,
    required this.emotion,
    required this.duration,
  });
}