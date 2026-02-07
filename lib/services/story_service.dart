import '../core/http_service.dart';
import '../core/api.dart';

class StoryService {
  static Future<List<dynamic>> getStories() async {
    return await HttpService.get('${Api.baseUrl}/stories');
  }

  static Future<void> markViewed(int storyId, String username) async {
    await HttpService.post(
      '${Api.baseUrl}/stories/$storyId/view',
      {'username': username},
    );
  }
}
