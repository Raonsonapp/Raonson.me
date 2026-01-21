import 'generation_task.dart';

class GenerationState {
  final List<GenerationTask> tasks;

  const GenerationState({
    this.tasks = const [],
  });

  GenerationState copyWith({
    List<GenerationTask>? tasks,
  }) {
    return GenerationState(
      tasks: tasks ?? this.tasks,
    );
  }
}