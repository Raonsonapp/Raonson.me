import 'fx_keyframe.dart';

class FxTimeline {
  final List<FxKeyframe> frames = [];

  void add(FxKeyframe frame) {
    frames.add(frame);
  }
}