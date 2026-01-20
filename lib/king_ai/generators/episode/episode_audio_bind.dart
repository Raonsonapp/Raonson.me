class EpisodeAudioBind {
  Map<String, dynamic> bind({
    required List audioTracks,
    required int fps,
  }) {
    return {
      "fps": fps,
      "audio_tracks": audioTracks,
      "sync": "frame_based",
    };
  }
}