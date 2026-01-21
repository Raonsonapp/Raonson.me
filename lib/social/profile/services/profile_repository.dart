import 'profile_service.dart';
import 'follow_service.dart';
import 'verified_service.dart';
import '../core/user_profile.dart';
import '../core/profile_stats.dart';

class ProfileRepository {
  final ProfileService profileService;
  final FollowService followService;
  final VerifiedService verifiedService;

  ProfileRepository({
    required this.profileService,
    required this.followService,
    required this.verifiedService,
  });

  Future<UserProfile> getProfile(String userId) {
    return profileService.fetchProfile(userId);
  }

  Future<ProfileStats> getStats(String userId) {
    return profileService.fetchStats(userId);
  }

  Future<bool> follow(String userId) {
    return followService.follow(userId);
  }

  Future<bool> unfollow(String userId) {
    return followService.unfollow(userId);
  }

  Future<bool> isVerified(String userId) {
    return verifiedService.hasVerified(userId);
  }
}