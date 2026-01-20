enum KingTaskType {
  flutterApp,
  game,
  backend,
  aiTool,
}

class KingAIRequest {
  final KingTaskType type;
  final String prompt;
  final Map<String, dynamic> options;

  KingAIRequest({
    required this.type,
    required this.prompt,
    this.options = const {},
  });
}