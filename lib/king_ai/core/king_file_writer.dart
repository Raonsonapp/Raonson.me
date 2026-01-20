import 'generated_file.dart';

class KingFileWriter {
  Future<void> writeFiles(List<GeneratedFile> files) async {
    for (final file in files) {
      // In real version:
      // create directories
      // write to disk
      // commit to git
      print('Creating file: ${file.path}');
    }
  }
}