import 'voice_profile.dart';

class VoiceLibrary {
  static VoiceProfile jpHero() => VoiceProfile(
        language: "jp",
        gender: "male",
        emotion: "heroic",
        pitch: 1.0,
        speed: 1.0,
      );

  static VoiceProfile faNarrator() => VoiceProfile(
        language: "fa",
        gender: "male",
        emotion: "dramatic",
        pitch: 0.95,
        speed: 0.9,
      );

  static VoiceProfile enVillain() => VoiceProfile(
        language: "en",
        gender: "male",
        emotion: "dark",
        pitch: 0.85,
        speed: 0.95,
      );
}