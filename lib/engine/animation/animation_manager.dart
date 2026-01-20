import 'core/animation_clip.dart';
import 'services/animation_engine.dart';

class AnimationManager {
  AnimationManager._();
  static final AnimationManager instance = AnimationManager._();

  Future<void> play(AnimationClip clip) async {
    await AnimationEngine().execute(clip);
  }
}