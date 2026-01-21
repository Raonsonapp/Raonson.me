import 'voice_model.dart';
import 'dialog_line.dart';

class VoiceTrack {
  final VoiceModel voice;
  final List<DialogLine> lines;

  VoiceTrack({
    required this.voice,
    required this.lines,
  });
}