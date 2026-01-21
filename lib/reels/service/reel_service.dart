import '../models/reel_model.dart';

class ReelService {
  Future<List<ReelModel>> fetchReels() async {
    await Future.delayed(const Duration(milliseconds: 500));

    return List.generate(
      5,
      (i) => ReelModel(
        id: '$i',
        videoUrl:
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
        author: 'User_$i',
        likes: 120 * i,
        comments: 15 * i,
      ),
    );
  }
}
