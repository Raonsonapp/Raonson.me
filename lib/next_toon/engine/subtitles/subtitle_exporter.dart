import 'subtitle_track.dart';

class SubtitleExporter {
  String exportSRT(SubtitleTrack track) {
    final buffer = StringBuffer();
    int index = 1;

    for (final line in track.lines) {
      buffer.writeln(index++);
      buffer.writeln(
        '${_fmt(line.start)} --> ${_fmt(line.end)}',
      );
      buffer.writeln(line.text);
      buffer.writeln();
    }

    return buffer.toString();
  }

  String _fmt(Duration d) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(d.inHours)}:${two(d.inMinutes % 60)}:${two(d.inSeconds % 60)},${(d.inMilliseconds % 1000).toString().padLeft(3, '0')}';
  }
}