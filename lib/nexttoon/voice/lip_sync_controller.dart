import 'phoneme_frame.dart';

class LipSyncController {
  double mouthOpen = 0.0;
  double mouthWide = 0.0;

  void applyPhoneme(PhonemeFrame frame) {
    switch (frame.phoneme) {
      case 'A':
        mouthOpen = 1.0 * frame.intensity;
        mouthWide = 0.4;
        break;
      case 'O':
        mouthOpen = 0.7;
        mouthWide = 0.2;
        break;
      case 'E':
        mouthOpen = 0.5;
        mouthWide = 0.8;
        break;
      case 'M':
        mouthOpen = 0.1;
        mouthWide = 0.1;
        break;
      default:
        mouthOpen = 0.0;
        mouthWide = 0.0;
    }
  }

  Map<String, double> currentState() => {
        'mouthOpen': mouthOpen,
        'mouthWide': mouthWide,
      };
}