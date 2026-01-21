// media/services/media_mock_data_service.dart

class MediaMockDataService {
  List<Map<String, dynamic>> getSampleVideos() {
    return [
      {
        'id': '1',
        'title': 'Anime Episode 1',
        'duration': 600,
        'qualities': ['360', '480', '720', '1080'],
      },
      {
        'id': '2',
        'title': 'Reel Video',
        'duration': 30,
        'qualities': ['480', '720'],
      },
    ];
  }
}