import 'voice_language.dart';

class VoiceActor {
  final String id;
  final String name;
  final VoiceLanguage language;
  final bool isPremium;

  VoiceActor({
    required this.id,
    required this.name,
    required this.language,
    this.isPremium = false,
  });
}