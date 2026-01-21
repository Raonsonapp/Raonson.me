import 'dialog_line.dart';
import 'voice_actor.dart';

class DubRequest {
  final VoiceActor actor;
  final DialogLine line;

  DubRequest({
    required this.actor,
    required this.line,
  });
}