import 'follow_state.dart';

class FollowNotifier {
  FollowState state = FollowState(isFollowing: false);

  void follow() {
    state = state.copyWith(isFollowing: true);
  }

  void unfollow() {
    state = state.copyWith(isFollowing: false);
  }

  void setLoading(bool value) {
    state = state.copyWith(loading: value);
  }
}
