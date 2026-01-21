import 'dart:async';
import '../base/ai_generator.dart';

/// Навъи лоиҳа
enum ProjectType {
  flutterApp,
  game2D,
  game3D,
  aiPlatform,
  animation,
}

/// Як фазаи лоиҳа
class ProjectPhase {
  final String id;
  final String title;
  final int steps;

  const ProjectPhase({
    required this.id,
    required this.title,
    required this.steps,
  });
}

/// Генератори асосии лоиҳа
class ProjectGenerator extends AIGenerator {
  final String projectId;
  final ProjectType type;
  final List<ProjectPhase> phases;

  int _currentPhaseIndex = 0;
  int _currentPhaseStep = 0;

  ProjectGenerator({
    required this.projectId,
    required this.type,
    required this.phases,
  });

  @override
  String get generatorId => 'project_$projectId';

  @override
  String get displayName => 'Project Generator ($projectId)';

  @override
  int get totalSteps =>
      phases.fold(0, (sum, p) => sum + p.steps);

  @override
  Future<void> start() async {
    await runGenerator();
  }

  @override
  Future<void> generateStep(int stepIndex) async {
    if (_currentPhaseIndex >= phases.length) return;

    final phase = phases[_currentPhaseIndex];

    // Симуляция кори вазнин (дар воқеият — LLM, compiler, assets)
    await Future.delayed(const Duration(milliseconds: 120));

    _currentPhaseStep++;

    // Агар фаза тамом шуд
    if (_currentPhaseStep >= phase.steps) {
      _currentPhaseIndex++;
      _currentPhaseStep = 0;
    }
  }

  @override
  Future<void> onComplete() async {
    // Финализация (manifest, index, export)
    await Future.delayed(const Duration(milliseconds: 300));
  }
}