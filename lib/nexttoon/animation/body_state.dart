class BodyState {
  double headTilt;
  double headTurn;
  double shoulderShift;
  double torsoLean;

  BodyState({
    required this.headTilt,
    required this.headTurn,
    required this.shoulderShift,
    required this.torsoLean,
  });

  factory BodyState.neutral() {
    return BodyState(
      headTilt: 0.0,
      headTurn: 0.0,
      shoulderShift: 0.0,
      torsoLean: 0.0,
    );
  }
}