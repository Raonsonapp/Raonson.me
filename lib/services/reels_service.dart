import 'api_service.dart';

class ReelsService {
  static Future<List<dynamic>> getReels() async {
    return await ApiService.get('/reels');
  }

  static Future<void> addView(int reelId) async {
    await ApiService.post('/reels/$reelId/view', {});
  }

  static Future<void> likeReel(int reelId) async {
    await ApiService.post('/reels/$reelId/like', {});
  }
}
