class LipSyncEngine {
  List<double> generatePhonemes(String text) {
    return List.generate(text.length, (i) => i * 0.05);
  }
}