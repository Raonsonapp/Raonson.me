import 'voice_language.dart';

class VoicePolicy {
  final bool isPremiumUser;

  VoicePolicy(this.isPremiumUser);

  bool canUseLanguage(VoiceLanguage language) {
    if (language == VoiceLanguage.japanese) return true;
    return isPremiumUser;
  }
}