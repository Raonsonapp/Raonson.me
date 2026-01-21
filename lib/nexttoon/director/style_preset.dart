import 'anime_style.dart';
import 'scene_type.dart';

class StylePreset {
  final AnimeStyle style;
  final Map<SceneType, double> intensity;

  StylePreset({
    required this.style,
    required this.intensity,
  });
}