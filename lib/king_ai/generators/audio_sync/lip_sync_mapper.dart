class LipSyncMapper {
  Map<String, dynamic> map({
    required String audioText,
    required int frameStart,
    required int frameEnd,
  }) {
    return {
      "text": audioText,
      "start_frame": frameStart,
      "end_frame": frameEnd,
      "phonemes": _phonemes(audioText),
    };
  }

  List<String> _phonemes(String text) {
    return text.split('').map((e) => "ph_$e").toList();
  }
}