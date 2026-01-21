import '../generation_result.dart';
import 'render_job.dart';

class RenderQueueExport {
  GeneratedFile export(List<RenderJob> jobs) {
    return GeneratedFile(
      path: "nexttoon/render/render_queue.json",
      content: jobs
          .map((j) => {
                "id": j.id,
                "status": j.status.name,
                "progress": j.progress,
                "error": j.error,
              })
          .toList()
          .toString(),
    );
  }
}