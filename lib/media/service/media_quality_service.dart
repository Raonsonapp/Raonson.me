// media/services/media_quality_service.dart

enum VideoQuality { q360, q480, q720, q1080 }

class MediaQualityService {
  VideoQuality _current = VideoQuality.q720;

  void setQuality(VideoQuality quality) {
    _current = quality;
  }

  VideoQuality get current => _current;
}