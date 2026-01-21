import '../core/user_profile.dart';
import '../core/profile_stats.dart';

class ProfileService {
  Future<UserProfile> fetchProfile(String userId) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return UserProfile(
      id: userId,
      username: 'raonson_user',
      displayName: 'Raonson Creator',
      avatarUrl: '',
      bio: 'Anime • AI • Creator',
    );
  }

  Future<ProfileStats> fetchStats(String userId) async {
    await Future.delayed(const Duration(milliseconds: 300));

    return ProfileStats(
      followers: 12450,
      following: 210,
      posts: 87,
    );
  }
}