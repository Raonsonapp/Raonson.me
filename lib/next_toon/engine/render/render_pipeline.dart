import 'video_audio_muxer.dart';
import 'mux_request.dart';
import 'final_episode.dart';

class RenderPipeline {
  final VideoAudioMuxer muxer = VideoAudioMuxer();

  Future<FinalEpisode> run(MuxRequest request) async {
    final outputPath = await muxer.mux(request);

    return FinalEpisode(
      videoPath: outputPath,
      success: true,
    );
  }
}