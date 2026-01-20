import 'generator_logs_model.dart';

class GeneratorLogsService {
  final Map<String, List<GeneratorLog>> _logs = {};

  void add(String taskId, String message) {
    _logs.putIfAbsent(taskId, () => []);
    _logs[taskId]!.add(
      GeneratorLog(time: DateTime.now(), message: message),
    );
  }

  List<GeneratorLog> get(String taskId) {
    return _logs[taskId] ?? [];
  }
}