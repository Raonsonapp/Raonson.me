class FrameComposer {
  Map<String, dynamic> composeFrame({
    required int frameIndex,
    required String style,
  }) {
    return {
      "frame": frameIndex,
      "camera": _camera(style),
      "fx": _fx(style),
      "timing": _timing(),
      "quality": "cinematic_anime",
    };
  }

  String _camera(String style) {
    if (style == "action") return "fast_pan";
    if (style == "dramatic") return "slow_zoom";
    return "dynamic_follow";
  }

  List<String> _fx(String style) {
    switch (style) {
      case "demon_slayer":
        return ["breathing_fx", "energy_trail", "motion_blur"];
      case "jjk":
        return ["curse_energy", "dark_aura", "shake"];
      default:
        return ["glow", "soft_blur"];
    }
  }

  Map<String, dynamic> _timing() {
    return {
      "fps": 24,
      "interpolation": true,
    };
  }
}