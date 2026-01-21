import 'voice_language.dart';

class VoiceTrack {
  final VoiceLanguage language;
  final String audioPath;
  final Duration startAt;

  VoiceTrack({
    required this.language,
    required this.audioPath,
    required this.startAt,
  });
}