import 'lip_frame.dart';

class LipSequence {
  final String characterId;
  final List<LipFrame> frames;

  LipSequence({
    required this.characterId,
    required this.frames,
  });
}