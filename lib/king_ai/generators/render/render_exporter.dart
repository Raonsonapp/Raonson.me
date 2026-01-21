import '../generation_result.dart';

class RenderExporter {
  GeneratedFile export(Map<String, dynamic> renderPayload) {
    return GeneratedFile(
      path: "nexttoon/render/render_request.json",
      content: renderPayload.toString(),
    );
  }
}