import 'face_state.dart';
import 'body_state.dart';

enum Emotion {
  neutral,
  happy,
  angry,
  sad,
  shocked,
}

class CharacterAnimationController {
  FaceState face = FaceState.neutral();
  BodyState body = BodyState.neutral();

  void applyEmotion(Emotion emotion) {
    switch (emotion) {
      case Emotion.happy:
        face = face.copyWith(
          eyebrowRaise: 0.4,
          eyeOpen: 1.0,
          mouthWide: 0.7,
        );
        body = body.copyWith(torsoLean: 0.1);
        break;

      case Emotion.angry:
        face = face.copyWith(
          eyebrowRaise: -0.4,
          eyeOpen: 0.8,
          mouthOpen: 0.6,
        );
        body = body.copyWith(headTilt: -0.2);
        break;

      case Emotion.sad:
        face = face.copyWith(
          eyeOpen: 0.5,
          mouthOpen: 0.2,
        );
        body = body.copyWith(torsoLean: -0.2);
        break;

      case Emotion.shocked:
        face = face.copyWith(
          eyeOpen: 1.2,
          mouthOpen: 1.0,
        );
        body = body.copyWith(headTilt: 0.3);
        break;

      case Emotion.neutral:
      default:
        face = FaceState.neutral();
        body = BodyState.neutral();
    }
  }
}