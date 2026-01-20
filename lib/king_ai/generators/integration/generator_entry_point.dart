import '../state/generation_request.dart';
import 'generator_integration_service.dart';
import 'generator_media_bridge.dart';
import 'generator_reels_adapter.dart';

class GeneratorEntryPoint {
  final _service = GeneratorIntegrationService();
  final _mediaBridge = GeneratorMediaBridge();
  final _reelsAdapter = GeneratorReelsAdapter();

  Future<void> start(GenerationRequest request) async {
    final output = await _service.run(request);
    _mediaBridge.registerEpisode(output);
    _reelsAdapter.createPreview(output);
  }
}