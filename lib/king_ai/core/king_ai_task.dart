enum KingAITaskType {
  appBuild,
  gameBuild,
  uiGenerate,
  backendLogic,
  refactor,
}

class KingAITask {
  final String id;
  final KingAITaskType type;
  final String prompt;
  final DateTime createdAt;

  KingAITask({
    required this.id,
    required this.type,
    required this.prompt,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();
}