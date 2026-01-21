class GenerationResult {
  final String type;
  final DateTime createdAt;
  final List<GeneratedFile> files;

  GenerationResult({
    required this.type,
    required this.createdAt,
    required this.files,
  });
}

class GeneratedFile {
  final String path;
  final String content;

  GeneratedFile({
    required this.path,
    required this.content,
  });
}