class PacingEngine {
  int normalize(int seconds) {
    if (seconds < 15) return 15;
    if (seconds > 60) return 45;
    return seconds;
  }
}