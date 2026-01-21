class GenerationRequest {
  final String type; // flutter | anime | game
  final String projectName;
  final Map<String, dynamic> options;

  GenerationRequest({
    required this.type,
    required this.projectName,
    this.options = const {},
  });

  T? option<T>(String key) => options[key] as T?;
}