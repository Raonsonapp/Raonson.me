// media/services/media_audio_service.dart

class MediaAudioService {
  String _language = 'original';

  void setLanguage(String lang) {
    _language = lang;
  }

  String get language => _language;
}
