import 'phoneme.dart';

class PhonemeFrame {
  final Phoneme phoneme;
  final Duration start;
  final Duration duration;

  PhonemeFrame({
    required this.phoneme,
    required this.start,
    required this.duration,
  });
}