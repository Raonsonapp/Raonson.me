import 'phoneme.dart';
import 'mouth_state.dart';

class MouthMapper {
  MouthState map(Phoneme phoneme) {
    switch (phoneme) {
      case Phoneme.A:
      case Phoneme.O:
        return MouthState(phoneme: phoneme, openness: 0.9);
      case Phoneme.E:
      case Phoneme.I:
        return MouthState(phoneme: phoneme, openness: 0.6);
      case Phoneme.M:
      case Phoneme.F:
        return MouthState(phoneme: phoneme, openness: 0.2);
      default:
        return MouthState(phoneme: Phoneme.REST, openness: 0.0);
    }
  }
}