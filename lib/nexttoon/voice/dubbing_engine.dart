import 'dub_track.dart';
import 'voice_line.dart';
import 'voice_emotion.dart';

class DubbingEngine {
  DubTrack generateDub({
    required DubTrack baseTrack,
    required String translatedText,
  }) {
    final words = translatedText.split(' ');
    final lines = <VoiceLine>[];

    for (int i = 0; i < words.length; i += 6) {
      lines.add(
        VoiceLine(
          text: words.skip(i).take(6).join(' '),
          emotion: _autoEmotion(i),
          duration: const Duration(milliseconds: 900),
        ),
      );
    }

    return DubTrack(
      language: baseTrack.language,
      actor: baseTrack.actor,
      lines: lines,
    );
  }

  VoiceEmotion _autoEmotion(int index) {
    if (index % 4 == 0) return VoiceEmotion.epic;
    if (index % 3 == 0) return VoiceEmotion.angry;
    if (index % 2 == 0) return VoiceEmotion.sad;
    return VoiceEmotion.neutral;
  }
}