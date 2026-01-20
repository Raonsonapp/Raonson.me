import 'parsed_intent.dart';

class KingPromptParser {
  ParsedIntent parse(String prompt) {
    final text = prompt.toLowerCase();

    if (text.contains('аниме') || text.contains('anime')) {
      return ParsedIntent(
        intent: KingIntent.anime,
        features: ['episodes', 'voices', 'effects'],
        estimatedFiles: 1200,
      );
    }

    if (text.contains('бозӣ') || text.contains('game')) {
      return ParsedIntent(
        intent: KingIntent.game,
        features: ['engine', 'player', 'ui', 'logic'],
        estimatedFiles: 1500,
      );
    }

    if (text.contains('flutter') ||
        text.contains('app') ||
        text.contains('инстаграм')) {
      return ParsedIntent(
        intent: KingIntent.flutterApp,
        features: ['auth', 'feed', 'reels', 'chat', 'live'],
        estimatedFiles: 900,
      );
    }

    return ParsedIntent(
      intent: KingIntent.unknown,
      features: [],
      estimatedFiles: 0,
    );
  }
}