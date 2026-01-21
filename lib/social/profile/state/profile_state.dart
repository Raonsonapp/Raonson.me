import '../core/user_profile.dart';
import '../core/profile_stats.dart';

class ProfileState {
  final UserProfile? profile;
  final ProfileStats? stats;
  final bool loading;
  final String? error;

  ProfileState({
    this.profile,
    this.stats,
    this.loading = false,
    this.error,
  });

  ProfileState copyWith({
    UserProfile? profile,
    ProfileStats? stats,
    bool? loading,
    String? error,
  }) {
    return ProfileState(
      profile: profile ?? this.profile,
      stats: stats ?? this.stats,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}