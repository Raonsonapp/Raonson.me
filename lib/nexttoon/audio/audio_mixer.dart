import 'audio_track.dart';
import 'audio_mix_state.dart';
import 'audio_type.dart';

class AudioMixer {
  AudioMixState mix({
    required List<AudioTrack> tracks,
  }) {
    // Placeholder for DSP / FFmpeg / API logic
    return AudioMixState(tracks: tracks);
  }

  double normalizeVolume(double volume) {
    if (volume < 0) return 0;
    if (volume > 1) return 1;
    return volume;
  }
}