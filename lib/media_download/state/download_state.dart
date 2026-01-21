import '../models/download_task.dart';
import '../models/dubbing_task.dart';

class DownloadState {
  final List<DownloadTask> downloads = [];
  final List<DubbingTask> dubbings = [];

  void addDownload(DownloadTask t) => downloads.add(t);
  void addDubbing(DubbingTask t) => dubbings.add(t);
}
