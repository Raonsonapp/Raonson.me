import 'voice_actor.dart';
import 'voice_line.dart';
import 'voice_language.dart';

class DubTrack {
  final VoiceLanguage language;
  final VoiceActor actor;
  final List<VoiceLine> lines;

  DubTrack({
    required this.language,
    required this.actor,
    required this.lines,
  });

  Duration get totalDuration =>
      lines.fold(Duration.zero, (a, b) => a + b.duration);
}