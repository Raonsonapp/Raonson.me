enum KingIntent {
  flutterApp,
  game,
  anime,
  backend,
  unknown,
}

class ParsedIntent {
  final KingIntent intent;
  final List<String> features;
  final int estimatedFiles;

  ParsedIntent({
    required this.intent,
    required this.features,
    required this.estimatedFiles,
  });
}