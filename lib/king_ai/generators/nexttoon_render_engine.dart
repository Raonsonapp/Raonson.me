class NextToonRenderEngine {
  Map<String, dynamic> render({
    required int scenes,
    required int minutes,
  }) {
    return {
      "renderer": "nexttoon_core",
      "resolution": "1080p",
      "fps": 24,
      "estimated_files": scenes * 12,
      "estimated_duration_min": minutes,
    };
  }
}