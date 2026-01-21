import 'advanced_fx_model.dart';
import 'advanced_fx_type.dart';

class FxAnimePresets {
  static AdvancedFxModel demonSlayerFire(String layer) =>
      AdvancedFxModel(
        type: AdvancedFxType.fire,
        start: Duration.zero,
        duration: const Duration(seconds: 3),
        power: 1.5,
        layerId: layer,
      );

  static AdvancedFxModel soloLevelingAura(String layer) =>
      AdvancedFxModel(
        type: AdvancedFxType.aura,
        start: Duration.zero,
        duration: const Duration(seconds: 4),
        power: 2.0,
        layerId: layer,
      );
}