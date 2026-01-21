import 'audio_analysis.dart';
import 'phoneme.dart';

class LipSyncController {
  Phoneme getCurrentPhoneme(
    AudioAnalysis analysis,
    Duration currentTime,
  ) {
    for (final frame in analysis.frames) {
      if (currentTime >= frame.start &&
          currentTime < frame.start + frame.duration) {
        return frame.phoneme;
      }
    }
    return Phoneme.REST;
  }
}