import '../core/http_service.dart';

class StoryService {
  static Future<void> createStory(String imageUrl) async {
    await HttpService.post(
      '/stories',
      {
        'image_url': imageUrl,
      },
    );
  }

  static Future<List<dynamic>> getStories() async {
    final res = await HttpService.get('/stories');
    return res ?? [];
  }
}
