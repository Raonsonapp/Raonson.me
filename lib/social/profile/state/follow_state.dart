class FollowState {
  final bool isFollowing;
  final bool loading;

  FollowState({
    required this.isFollowing,
    this.loading = false,
  });

  FollowState copyWith({
    bool? isFollowing,
    bool? loading,
  }) {
    return FollowState(
      isFollowing: isFollowing ?? this.isFollowing,
      loading: loading ?? this.loading,
    );
  }
}