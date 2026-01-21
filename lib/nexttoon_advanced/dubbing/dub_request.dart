import 'character_voice.dart';

class DubRequest {
  final String episodeId;
  final List<CharacterVoice> voices;
  final String script;
  final Duration duration;

  DubRequest({
    required this.episodeId,
    required this.voices,
    required this.script,
    required this.duration,
  });
}