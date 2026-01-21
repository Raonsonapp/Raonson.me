class NextToonState {
  double progress = 0;
  String stage = 'idle';

  void update(double p, String s) {
    progress = p;
    stage = s;
  }
}
