import '../models/reel_model.dart';

class ReelState {
  final List<ReelModel> reels;
  final bool loading;

  ReelState({
    this.reels = const [],
    this.loading = false,
  });
}
