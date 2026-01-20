class PacingEngine {
  double adjust(double duration, {required bool epic}) {
    if (epic) return duration * 1.2;
    return duration * 0.9;
  }
}
