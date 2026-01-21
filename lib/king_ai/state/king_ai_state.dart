import 'king_ai_status.dart';
import '../core/king_ai_result.dart';

class KingAIState {
  final KingAIStatus status;
  final double progress;
  final String? message;
  final KingAIResult? result;

  const KingAIState({
    required this.status,
    required this.progress,
    this.message,
    this.result,
  });

  factory KingAIState.initial() {
    return const KingAIState(
      status: KingAIStatus.idle,
      progress: 0.0,
    );
  }

  KingAIState copyWith({
    KingAIStatus? status,
    double? progress,
    String? message,
    KingAIResult? result,
  }) {
    return KingAIState(
      status: status ?? this.status,
      progress: progress ?? this.progress,
      message: message ?? this.message,
      result: result ?? this.result,
    );
  }
}