import 'package:flutter/material.dart';
import '../services/profile_service.dart';
import 'profile_state.dart';

class ProfileController extends ChangeNotifier {
  final ProfileService _service = ProfileService();
  ProfileState state = ProfileState();

  Future<void> load(String userId) async {
    state = state.copyWith(loading: true);
    notifyListeners();

    final profile = await _service.loadProfile(userId);
    state = ProfileState(profile: profile);
    notifyListeners();
  notifyListeners}

  void toggleFollow() {
    if (state.profile == null) return;
    final isFollowing = !state.following;

    final updated = state.profile!.copyWith(
      followers: isFollowing
          ? state.profile!.followers + 1
          : state.profile!.followers - 1,
    );

    state = state.copyWith(
      profile: updated,
      following: isFollowing,
    );
    notifyListeners();
  }
}
