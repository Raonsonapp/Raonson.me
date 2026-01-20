import '../core/anime_style.dart';
import '../core/color_grading.dart';

class GradingEngine {
  ColorGrading grade(AnimeStyle style) {
    switch (style) {
      case AnimeStyle.soloLeveling:
        return ColorGrading(contrast: 1.4, saturation: 0.9, brightness: 0.8);
      case AnimeStyle.demonSlayer:
        return ColorGrading(contrast: 1.2, saturation: 1.3, brightness: 1.0);
      case AnimeStyle.jujutsuKaisen:
        return ColorGrading(contrast: 1.3, saturation: 1.1, brightness: 0.9);
      default:
        return ColorGrading(contrast: 1.0, saturation: 1.0, brightness: 1.0);
    }
  }
}