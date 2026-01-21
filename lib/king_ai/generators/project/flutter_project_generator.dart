import 'project_generator.dart';

/// Генератори махсус барои Flutter app
class FlutterProjectGenerator extends ProjectGenerator {
  FlutterProjectGenerator({
    required String projectId,
  }) : super(
          projectId: projectId,
          type: ProjectType.flutterApp,
          phases: const [
            ProjectPhase(
              id: 'core',
              title: 'Core & Config',
              steps: 20,
            ),
            ProjectPhase(
              id: 'auth',
              title: 'Authentication',
              steps: 25,
            ),
            ProjectPhase(
              id: 'ui',
              title: 'UI & Navigation',
              steps: 40,
            ),
            ProjectPhase(
              id: 'media',
              title: 'Reels / Video / Audio',
              steps: 35,
            ),
            ProjectPhase(
              id: 'chat',
              title: 'Chat Systems (GPT / KingAI)',
              steps: 30,
            ),
            ProjectPhase(
              id: 'platform',
              title: 'Android / iOS / Web',
              steps: 25,
            ),
            ProjectPhase(
              id: 'final',
              title: 'Optimization & Export',
              steps: 15,
            ),
          ],
        );

  /// Оценка шумораи файлҳо
  int estimateFileCount() {
    switch (type) {
      case ProjectType.flutterApp:
        return 250;
      default:
        return 100;
    }
  }

  /// Оценка вақти кор (соат)
  int estimateHours() {
    return 40; // ~5–7 рӯз кор
  }

  /// Метадатаи лоиҳа
  Map<String, dynamic> getProjectMeta() {
    return {
      'id': projectId,
      'type': 'Flutter App',
      'files': estimateFileCount(),
      'estimated_hours': estimateHours(),
      'features': [
        'Auth',
        'Reels',
        'ChatGPT',
        'King AI',
        'NextToon-ready',
        'Android',
        'iOS',
        'Web',
      ],
    };
  }
}