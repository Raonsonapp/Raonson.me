import 'dart:async';

/// Статуси генерация
enum GeneratorStatus {
  idle,
  running,
  paused,
  completed,
  failed,
  cancelled,
}

/// Progress-и умумӣ
class GeneratorProgress {
  final int totalSteps;
  final int currentStep;
  final String message;

  const GeneratorProgress({
    required this.totalSteps,
    required this.currentStep,
    required this.message,
  });

  double get percent =>
      totalSteps == 0 ? 0 : (currentStep / totalSteps) * 100;
}

/// Абстраксияи асосии ҲАМА генераторҳо
abstract class AIGenerator {
  /// ID-и генератор (масалан: king_ai_flutter, nexttoon_episode)
  String get generatorId;

  /// Номи инсонфаҳм
  String get displayName;

  /// Шумораи умумии қадамҳо
  int get totalSteps;

  GeneratorStatus _status = GeneratorStatus.idle;
  GeneratorProgress? _progress;

  final StreamController<GeneratorProgress> _progressController =
      StreamController.broadcast();

  GeneratorStatus get status => _status;
  GeneratorProgress? get progress => _progress;

  Stream<GeneratorProgress> get progressStream =>
      _progressController.stream;

  /// Оғози генерация
  Future<void> start();

  /// Қадами навбатӣ (ҳар генератор худаш месозад)
  Future<void> generateStep(int stepIndex);

  /// Тозакунӣ пас аз анҷом
  Future<void> onComplete() async {}

  /// Идоракунии қатъ
  Future<void> cancel() async {
    _status = GeneratorStatus.cancelled;
    _progressController.close();
  }

  /// Пауза
  void pause() {
    if (_status == GeneratorStatus.running) {
      _status = GeneratorStatus.paused;
    }
  }

  /// Давом додан
  void resume() {
    if (_status == GeneratorStatus.paused) {
      _status = GeneratorStatus.running;
    }
  }

  /// Иҷрои генерация бо loop
  @protected
  Future<void> runGenerator() async {
    try {
      _status = GeneratorStatus.running;

      for (int step = 0; step < totalSteps; step++) {
        if (_status == GeneratorStatus.cancelled) {
          return;
        }

        while (_status == GeneratorStatus.paused) {
          await Future.delayed(const Duration(milliseconds: 300));
        }

        await generateStep(step);

        _progress = GeneratorProgress(
          totalSteps: totalSteps,
          currentStep: step + 1,
          message: 'Step ${step + 1} / $totalSteps',
        );

        _progressController.add(_progress!);
      }

      _status = GeneratorStatus.completed;
      await onComplete();
      _progressController.close();
    } catch (e) {
      _status = GeneratorStatus.failed;
      _progressController.add(
        GeneratorProgress(
          totalSteps: totalSteps,
          currentStep: 0,
          message: 'Error: $e',
        ),
      );
      _progressController.close();
    }
  }
}
