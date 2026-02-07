import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import '../core/api.dart';

class UploadService {
  static Future<String> uploadImage(File file) async {
    final uri = Uri.parse('${Api.baseUrl}/upload');
    final req = http.MultipartRequest('POST', uri);

    final stream = http.ByteStream(file.openRead());
    final length = await file.length();

    final multipart = http.MultipartFile(
      'file',
      stream,
      length,
      filename: basename(file.path),
    );

    req.files.add(multipart);

    final res = await req.send();
    if (res.statusCode != 200 && res.statusCode != 201) {
      throw Exception('Upload failed');
    }

    final body = await res.stream.bytesToString();
    // интизорем JSON бо image_url
    final match = RegExp(r'"image_url"\s*:\s*"([^"]+)"').firstMatch(body);
    if (match == null) {
      throw Exception('Invalid upload response');
    }
    return match.group(1)!;
  }
}
