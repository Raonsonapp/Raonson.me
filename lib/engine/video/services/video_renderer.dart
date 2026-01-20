import '../core/episode.dart';

class VideoRenderer {
  Future<void> render(Episode episode) async {
    // Placeholder: FFmpeg / GPU / Cloud render later
    await Future.delayed(const Duration(seconds: 2));
  }
}