import '../core/king_ai_engine.dart';
import '../core/king_ai_task.dart';
import '../core/king_ai_context.dart';
import '../core/king_ai_result.dart';

class KingAIService {
  final KingAIEngine _engine = KingAIEngine();

  Future<KingAIResult> runTask({
    required KingAITask task,
    required KingAIContext context,
  }) async {
    return await _engine.execute(
      task: task,
      context: context,
    );
  }
}