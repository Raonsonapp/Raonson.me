/// lib/engine/video/services/video_concat_service.dart

class VideoConcatService {
  Future<String> concat(List<String> clips) async {
    // Placeholder for FFmpeg / MediaCodec pipeline

    // Simulate output
    return 'output/final_video_${DateTime.now().millisecondsSinceEpoch}.mp4';
  }
}