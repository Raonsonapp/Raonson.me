class KingAIResult {
  final bool success;
  final List<String> generatedFiles;
  final String message;

  KingAIResult({
    required this.success,
    required this.generatedFiles,
    required this.message,
  });
}