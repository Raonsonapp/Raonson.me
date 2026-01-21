import 'reel_state.dart';
import '../services/reel_service.dart';

class ReelController {
  final ReelService _service = ReelService();
  ReelState state = ReelState();

  Future<void> loadReels() async {
    state = ReelState(loading: true);

    final reels = await _service.fetchReels();

    state = ReelState(reels: reels, loading: false);
  final}
}
