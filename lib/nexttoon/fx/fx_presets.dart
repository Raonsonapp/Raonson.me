import 'fx_model.dart';
import 'fx_type.dart';

class FxPresets {
  static FxModel demonSlayerFire() => FxModel(
        type: FxType.fire,
        start: Duration.zero,
        duration: const Duration(seconds: 2),
        intensity: 1.0,
      );

  static FxModel lightningStrike() => FxModel(
        type: FxType.lightning,
        start: Duration.zero,
        duration: const Duration(milliseconds: 800),
        intensity: 1.2,
      );
}