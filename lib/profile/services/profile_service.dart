import '../models/user_profile.dart';

class ProfileService {
  Future<UserProfile> loadProfile(String id) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return UserProfile(
      id: id,
      username: 'raonson_user',
      avatar: 'https://placehold.co/200',
      followers: 1240,
      following: 180,
      posts: 56,
      verified: true,
    );
  }
}
