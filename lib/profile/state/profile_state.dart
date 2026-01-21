import '../models/user_profile.dart';

class ProfileState {
  final bool loading;
  final UserProfile? profile;
  final bool following;

  ProfileState({
    this.loading = false,
    this.profile,
    this.following = false,
  });

  ProfileState copyWith({
    bool? loading,
    UserProfile? profile,
    bool? following,
  }) {
    return ProfileState(
      loading: loading ?? this.loading,
      profile: profile ?? this.profile,
      following: following ?? this.following,
    );
  }
}
