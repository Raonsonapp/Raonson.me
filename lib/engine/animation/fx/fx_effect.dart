enum FxType {
  slash,
  aura,
  lightning,
  fire,
  smoke,
}

class FxEffect {
  final FxType type;
  final int intensity;
  final int durationMs;

  FxEffect({
    required this.type,
    required this.intensity,
    required this.durationMs,
  });
}
