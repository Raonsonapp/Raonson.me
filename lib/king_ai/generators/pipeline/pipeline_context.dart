import '../state/generation_request.dart';

class PipelineContext {
  final GenerationRequest request;

  double progress = 0.0;
  String currentMessage = '';

  final Map<String, dynamic> data = {};

  PipelineContext(this.request);

  void update(double value, String message) {
    progress = value;
    currentMessage = message;
  }
}