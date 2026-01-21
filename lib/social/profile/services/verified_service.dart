class VerifiedService {
  Future<bool> hasVerified(String userId) async {
    await Future.delayed(const Duration(milliseconds: 200));

    // demo logic: premium users
    return userId.startsWith('pro_');
  }
}