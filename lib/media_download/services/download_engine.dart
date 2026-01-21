import '../models/download_task.dart';

class DownloadEngine {
  Future<void> start(DownloadTask task) async {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 300));
      task.progress = i / 10;
    }
  }
}
