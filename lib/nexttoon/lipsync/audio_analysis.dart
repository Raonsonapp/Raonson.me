import 'phoneme_frame.dart';

class AudioAnalysis {
  final List<PhonemeFrame> frames;

  AudioAnalysis({required this.frames});

  Duration get totalDuration =>
      frames.isEmpty ? Duration.zero : frames.last.start + frames.last.duration;
}
