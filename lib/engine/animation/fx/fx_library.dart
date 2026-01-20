import 'fx_effect.dart';

class FxLibrary {
  static FxEffect demonSlayerSlash() {
    return FxEffect(
      type: FxType.slash,
      intensity: 9,
      durationMs: 1200,
    );
  }

  static FxEffect soloLevelingAura() {
    return FxEffect(
      type: FxType.aura,
      intensity: 10,
      durationMs: 2000,
    );
  }
}