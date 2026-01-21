import 'anime_style.dart';
import 'scene_type.dart';
import 'style_preset.dart';

class StylePresets {
  static StylePreset soloLeveling() {
    return StylePreset(
      style: AnimeStyle.soloLeveling,
      intensity: {
        SceneType.battle: 1.0,
        SceneType.action: 0.9,
        SceneType.dialogue: 0.6,
        SceneType.cinematic: 0.8,
        SceneType.transition: 0.5,
      },
    );
  }

  static StylePreset demonSlayer() {
    return StylePreset(
      style: AnimeStyle.demonSlayer,
      intensity: {
        SceneType.battle: 0.95,
        SceneType.action: 0.85,
        SceneType.dialogue: 0.7,
        SceneType.cinematic: 0.9,
        SceneType.transition: 0.6,
      },
    );
  }
}