class EpisodeFramePack {
  Map<String, dynamic> pack({
    required int start,
    required int end,
    required String visualStyle,
  }) {
    return {
      "from": start,
      "to": end,
      "style": visualStyle,
      "engine": "nexttoon_frame_v1",
    };
  }
}