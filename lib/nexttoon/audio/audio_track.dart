import 'audio_clip.dart';
import 'audio_type.dart';

class AudioTrack {
  final AudioType type;
  final List<AudioClip> clips;

  AudioTrack({
    required this.type,
    required this.clips,
  });

  void addClip(AudioClip clip) {
    clips.add(clip);
  }
}