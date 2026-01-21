import 'lip_sequence.dart';
import 'lip_frame.dart';
import 'phoneme_mapper.dart';

class LipSyncEngine {
  LipSequence generate({
    required String characterId,
    required String text,
    required Duration duration,
  }) {
    final frames = <LipFrame>[];
    final step = duration.inMilliseconds ~/ text.length;

    for (int i = 0; i < text.length; i++) {
      frames.add(
        LipFrame(
          phoneme: PhonemeMapper.mapChar(text[i]),
          timestamp: Duration(milliseconds: step * i),
        ),
      );
    }

    return LipSequence(
      characterId: characterId,
      frames: frames,
    );
  }
}