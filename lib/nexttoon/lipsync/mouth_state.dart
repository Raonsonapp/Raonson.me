import 'phoneme.dart';

class MouthState {
  final Phoneme phoneme;
  final double openness; // 0.0 – 1.0

  MouthState({
    required this.phoneme,
    required this.openness,
  });
}