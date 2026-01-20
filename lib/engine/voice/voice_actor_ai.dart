import 'core/voice_profile.dart';
import 'core/voice_track.dart';
import 'services/dubbing_service.dart';

class VoiceActorAI {
  VoiceActorAI._();
  static final instance = VoiceActorAI._();

  Future<VoiceTrack> generate({
    required String text,
    required VoiceProfile profile,
    required String language,
  }) async {
    return DubbingService().dub(
      text: text,
      profile: profile,
      language: language,
    );
  }
}