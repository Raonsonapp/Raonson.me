class AudioRenderPayload {
  static Map<String, dynamic> build({
    required List tracks,
    required String format,
  }) {
    return {
      "format": format,
      "tracks": tracks,
      "engine": "nexttoon_voice_v1",
    };
  }
}