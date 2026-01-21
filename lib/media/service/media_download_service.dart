import '../models/media_quality.dart';

class MediaDownloadService {
  Future<void> download(String url, MediaQuality quality) async {
    // future: background downloader
    await Future.delayed(const Duration(seconds: 1));
  }
}