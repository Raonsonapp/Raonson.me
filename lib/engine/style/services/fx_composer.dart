import '../core/anime_style.dart';

class FXComposer {
  String compose(AnimeStyle style) {
    switch (style) {
      case AnimeStyle.soloLeveling:
        return 'dark_glow_particles';
      case AnimeStyle.demonSlayer:
        return 'fire_water_fx';
      case AnimeStyle.jujutsuKaisen:
        return 'cursed_energy_fx';
      case AnimeStyle.cinematic:
      default:
        return 'film_grain_light';
    }
  }
}
