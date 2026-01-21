import 'dub_language.dart';
import 'emotion_profile.dart';

class CharacterVoice {
  final String characterId;
  final DubLanguage language;
  final EmotionProfile emotion;
  final String voiceModel;

  CharacterVoice({
    required this.characterId,
    required this.language,
    required this.emotion,
    required this.voiceModel,
  });
}
