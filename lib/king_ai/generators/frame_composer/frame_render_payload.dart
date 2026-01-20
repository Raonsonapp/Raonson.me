class FrameRenderPayload {
  static Map<String, dynamic> build({
    required List frames,
    required String resolution,
  }) {
    return {
      "resolution": resolution,
      "frames": frames,
      "renderer": "nexttoon_engine",
    };
  }
}