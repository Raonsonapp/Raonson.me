import 'dart:convert';
import '../core/api.dart';
import '../core/http_service.dart';
import '../models/reel.dart';

class ReelsService {
  static Future<List<Reel>> fetchReels() async {
    final res = await HttpService.get(Api.reels);
    final List data = jsonDecode(res.body);
    return data.map((e) => Reel.fromJson(e)).toList();
  }
}
