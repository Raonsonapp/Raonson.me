import '../core/generator_request.dart';
import 'generation_status.dart';

class GenerationTask {
  final String id;
  final GeneratorRequest request;

  GenerationStatus status;
  double progress; // 0.0 → 1.0
  String? error;

  GenerationTask({
    required this.id,
    required this.request,
    this.status = GenerationStatus.queued,
    this.progress = 0.0,
    this.error,
  });
}