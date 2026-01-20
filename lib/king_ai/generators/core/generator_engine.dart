import 'generator_request.dart';
import 'generator_response.dart';
import 'generator_templates.dart';

class GeneratorEngine {
  GeneratorResponse generate(GeneratorRequest request) {
    final List<GeneratedFile> files = [];

    switch (request.type) {
      case GenerationType.app:
        for (final f in GeneratorTemplates.appTemplate(request.prompt)) {
          files.add(GeneratedFile(
            path: f["path"]!,
            content: f["content"]!,
          ));
        }
        break;

      case GenerationType.game:
        for (final f in GeneratorTemplates.gameTemplate(request.prompt)) {
          files.add(GeneratedFile(
            path: f["path"]!,
            content: f["content"]!,
          ));
        }
        break;

      case GenerationType.backend:
        for (final f in GeneratorTemplates.backendTemplate(request.prompt)) {
          files.add(GeneratedFile(
            path: f["path"]!,
            content: f["content"]!,
          ));
        }
        break;

      case GenerationType.ui:
        files.add(
          GeneratedFile(
            path: "lib/ui/generated_ui.dart",
            content: "// Generated UI\n${request.prompt}",
          ),
        );
        break;
    }

    return GeneratorResponse(
      title: "King AI Generation Complete",
      files: files,
      estimatedTime: const Duration(minutes: 5),
    );
  }
}
