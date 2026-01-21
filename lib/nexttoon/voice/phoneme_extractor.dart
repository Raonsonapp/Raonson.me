import 'phoneme_frame.dart';

class PhonemeExtractor {
  /// This simulates AI phoneme extraction
  /// Later replaced with real AI API
  List<PhonemeFrame> extract({
    required List<double> audioSamples,
    required int sampleRate,
  }) {
    final frames = <PhonemeFrame>[];
    final frameDuration = const Duration(milliseconds: 80);

    Duration cursor = Duration.zero;

    for (int i = 0; i < audioSamples.length; i += sampleRate ~/ 12) {
      frames.add(
        PhonemeFrame(
          phoneme: _mapAmplitude(audioSamples[i].abs()),
          start: cursor,
          end: cursor + frameDuration,
          intensity: audioSamples[i].abs().clamp(0.0, 1.0),
        ),
      );
      cursor += frameDuration;
    }

    return frames;
  }

  String _mapAmplitude(double amp) {
    if (amp > 0.7) return 'A';
    if (amp > 0.5) return 'O';
    if (amp > 0.3) return 'E';
    if (amp > 0.15) return 'M';
    return 'S';
  }
}