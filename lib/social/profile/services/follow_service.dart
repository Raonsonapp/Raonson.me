class FollowService {
  Future<bool> follow(String userId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return true;
  }

  Future<bool> unfollow(String userId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return false;
  }
}
