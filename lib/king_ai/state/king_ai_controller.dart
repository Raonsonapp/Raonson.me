import 'king_ai_state.dart';
import 'king_ai_status.dart';
import 'king_ai_history.dart';
import '../services/king_ai_service.dart';
import '../core/king_ai_task.dart';
import '../core/king_ai_context.dart';

class KingAIController {
  KingAIState _state = KingAIState.initial();
  final KingAIHistory history = KingAIHistory();
  final KingAIService _service = KingAIService();

  KingAIState get state => _state;

  void _update(KingAIState newState) {
    _state = newState;
  }

  Future<void> run({
    required KingAITask task,
    required KingAIContext context,
  }) async {
    try {
      _update(
        _state.copyWith(
          status: KingAIStatus.running,
          progress: 0.05,
          message: 'Starting KING AI task',
        ),
      );

      history.add('Task started', true);

      final result = await _service.runTask(
        task: task,
        context: context,
      );

      _update(
        _state.copyWith(
          status: KingAIStatus.completed,
          progress: 1.0,
          result: result,
          message: 'Task completed successfully',
        ),
      );

      history.add('Task completed', true);
    } catch (e) {
      _update(
        _state.copyWith(
          status: KingAIStatus.error,
          message: e.toString(),
        ),
      );

      history.add('Task failed', false);
    }
  }
}
