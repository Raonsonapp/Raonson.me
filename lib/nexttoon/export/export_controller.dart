import 'export_pipeline.dart';
import 'share_service.dart';

class ExportController {
  final ExportPipeline pipeline = ExportPipeline();
  final ShareService shareService = ShareService();

  void exportAndShare(List<String> sceneIds) {
    final videoPath = pipeline.exportEpisode(sceneIds);
    shareService.share(videoPath);
  }
}
