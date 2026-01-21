import 'profile_state.dart';
import '../core/user_profile.dart';
import '../core/profile_stats.dart';

class ProfileNotifier {
  ProfileState state = ProfileState(loading: true);

  void setProfile(UserProfile profile, ProfileStats stats) {
    state = state.copyWith(
      profile: profile,
      stats: stats,
      loading: false,
    );
  }

  void setLoading(bool value) {
    state = state.copyWith(loading: value);
  }

  void setError(String message) {
    state = state.copyWith(error: message, loading: false);
  }
}