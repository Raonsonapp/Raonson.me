import 'voice_language.dart';
import 'voice_emotion.dart';

class VoiceModel {
  final String characterId;
  final VoiceLanguage language;
  final VoiceEmotion emotion;
  final double pitch;
  final double speed;

  VoiceModel({
    required this.characterId,
    required this.language,
    required this.emotion,
    required this.pitch,
    required this.speed,
  });
}