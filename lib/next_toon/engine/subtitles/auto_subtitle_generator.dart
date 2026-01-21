import 'subtitle_line.dart';
import 'subtitle_track.dart';

class AutoSubtitleGenerator {
  Future<SubtitleTrack> generate({
    required String languageCode,
    required List<String> dialogLines,
  }) async {
    List<SubtitleLine> subtitles = [];
    Duration cursor = Duration.zero;

    for (final line in dialogLines) {
      final duration = Duration(milliseconds: 1500 + line.length * 40);

      subtitles.add(
        SubtitleLine(
          start: cursor,
          end: cursor + duration,
          text: line,
        ),
      );

      cursor += duration;
    }

    return SubtitleTrack(
      languageCode: languageCode,
      lines: subtitles,
    );
  }
}
