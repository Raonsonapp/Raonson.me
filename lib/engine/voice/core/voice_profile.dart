enum VoiceGender { male, female }
enum VoiceStyle { natural, anime, cinematic }

class VoiceProfile {
  final String id;
  final VoiceGender gender;
  final VoiceStyle style;
  final String language; // e.g. ja, en, ru, tg

  VoiceProfile({
    required this.id,
    required this.gender,
    required this.style,
    required this.language,
  });
}