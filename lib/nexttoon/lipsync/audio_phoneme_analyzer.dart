import 'phoneme.dart';
import 'phoneme_frame.dart';
import 'audio_analysis.dart';

class AudioPhonemeAnalyzer {
  AudioAnalysis analyze({
    required List<double> audioSamples,
    required int sampleRate,
  }) {
    final frames = <PhonemeFrame>[];

    // Placeholder logic (API-based later)
    frames.add(
      PhonemeFrame(
        phoneme: Phoneme.A,
        start: Duration(milliseconds: 0),
        duration: Duration(milliseconds: 120),
      ),
    );

    frames.add(
      PhonemeFrame(
        phoneme: Phoneme.M,
        start: Duration(milliseconds: 120),
        duration: Duration(milliseconds: 80),
      ),
    );

    return AudioAnalysis(frames: frames);
  }
}