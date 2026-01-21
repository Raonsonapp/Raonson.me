import 'fx_type.dart';

class FxPreset {
  final String name;
  final FxType type;
  final double baseIntensity;

  const FxPreset({
    required this.name,
    required this.type,
    required this.baseIntensity,
  });

  static const demonSlayerSlash = FxPreset(
    name: 'Demon Slayer Slash',
    type: FxType.slash,
    baseIntensity: 0.95,
  );

  static const soloLevelingAura = FxPreset(
    name: 'Solo Leveling Aura',
    type: FxType.aura,
    baseIntensity: 0.85,
  );
}