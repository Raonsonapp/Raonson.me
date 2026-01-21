import '../models/video_quality.dart';

class QualitySelector {
  static String label(VideoQuality q) {
    switch (q) {
      case VideoQuality.q360:
        return '360p';
      case VideoQuality.q480:
        return '480p';
      case VideoQuality.q720:
        return '720p HD';
      case VideoQuality.q1080:
        return '1080p Full HD';
    }
  }
}