// media/models/audio_track_model.dart

class AudioTrack {
  final String id;
  final String languageCode; // en, ru, tj, jp
  final String label; // English, Русский, Тоҷикӣ
  final String url;

  const AudioTrack({
    required this.id,
    required this.languageCode,
    required this.label,
    required this.url,
  });
}
