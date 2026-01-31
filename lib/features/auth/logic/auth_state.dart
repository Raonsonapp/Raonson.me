class AuthState {
  final bool loading;
  final bool success;
  final String? error;

  AuthState({this.loading = false, this.success = false, this.error});

  AuthState copyWith({bool? loading, bool? success, String? error}) {
    return AuthState(
      loading: loading ?? this.loading,
      success: success ?? this.success,
      error: error,
    );
  }
}
