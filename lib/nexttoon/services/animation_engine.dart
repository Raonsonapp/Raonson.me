import '../models/anime_scene.dart';
import '../models/animation_style.dart';

class AnimationEngine {
  Future<void> render(AnimeScene scene, AnimationStyle style) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }
}
