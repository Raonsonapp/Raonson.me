import 'face_state.dart';
import 'body_state.dart';

class AnimationFrame {
  final Duration time;
  final FaceState face;
  final BodyState body;

  AnimationFrame({
    required this.time,
    required this.face,
    required this.body,
  });
}
