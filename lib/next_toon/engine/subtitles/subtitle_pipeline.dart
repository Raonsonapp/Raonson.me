import 'auto_subtitle_generator.dart';
import 'multi_language_subtitles.dart';

class SubtitlePipeline {
  final AutoSubtitleGenerator generator = AutoSubtitleGenerator();

  Future<MultiLanguageSubtitles> build({
    required List<String> dialogs,
    required List<String> languages,
  }) async {
    final Map<String, dynamic> tracks = {};

    for (final lang in languages) {
      tracks[lang] = await generator.generate(
        languageCode: lang,
        dialogLines: dialogs,
      );
    }

    return MultiLanguageSubtitles(tracks);
  }
}