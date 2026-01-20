import '../core/king_ai_request.dart';
import 'parsed_intent.dart';

class ParserToCoreAdapter {
  KingAIRequest convert(
    ParsedIntent intent,
    String originalPrompt,
  ) {
    switch (intent.intent) {
      case KingIntent.flutterApp:
        return KingAIRequest(
          type: KingTaskType.flutterApp,
          prompt: originalPrompt,
          options: {
            'features': intent.features,
            'files': intent.estimatedFiles,
          },
        );

      case KingIntent.game:
        return KingAIRequest(
          type: KingTaskType.game,
          prompt: originalPrompt,
          options: {
            'engine': 'custom',
            'files': intent.estimatedFiles,
          },
        );

      case KingIntent.anime:
        return KingAIRequest(
          type: KingTaskType.aiTool,
          prompt: originalPrompt,
          options: {
            'episodes': true,
            'duration': '8-10 min',
          },
        );

      default:
        return KingAIRequest(
          type: KingTaskType.aiTool,
          prompt: originalPrompt,
        );
    }
  }
}