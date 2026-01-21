import 'mux_request.dart';

class VideoAudioMuxer {
  Future<String> mux(MuxRequest request) async {
    // Simulated render time
    await Future.delayed(const Duration(seconds: 2));

    final qualityName = request.quality.name;
    return '/render/final_episode_$qualityName.mp4';
  }
}