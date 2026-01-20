class GeneratorResponse {
  final String title;
  final List<GeneratedFile> files;
  final Duration estimatedTime;

  GeneratorResponse({
    required this.title,
    required this.files,
    required this.estimatedTime,
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