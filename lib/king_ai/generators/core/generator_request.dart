enum GenerationType {
  app,
  game,
  backend,
  ui,
}

class GeneratorRequest {
  final GenerationType type;
  final String prompt;
  final bool advanced;

  GeneratorRequest({
    required this.type,
    required this.prompt,
    this.advanced = false,
  });
}