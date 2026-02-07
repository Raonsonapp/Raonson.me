import '../core/api.dart';
import '../core/http_service.dart';

class StoryService {
  static Future<List<dynamic>> getStories() async {
    return await HttpService.get('${Api.baseUrl}/stories');
  }

  static Future<void> markViewed(String id, String user) async {
    await HttpService.post(
      '${Api.baseUrl}/stories/$id/view',
      body: {'user': user},
    );
  }

  static Future<void> create({
    required String user,
    required String mediaUrl,
  }) async {
    await HttpService.post(
      '${Api.baseUrl}/stories',
      body: {
        'user': user,
        'media': mediaUrl,
      },
    );
  }
}
