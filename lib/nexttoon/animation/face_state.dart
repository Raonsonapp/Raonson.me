class FaceState {
  double eyeOpen;
  double eyeBlink;
  double eyebrowRaise;
  double mouthOpen;
  double mouthWide;

  FaceState({
    required this.eyeOpen,
    required this.eyeBlink,
    required this.eyebrowRaise,
    required this.mouthOpen,
    required this.mouthWide,
  });

  factory FaceState.neutral() {
    return FaceState(
      eyeOpen: 1.0,
      eyeBlink: 0.0,
      eyebrowRaise: 0.0,
      mouthOpen: 0.0,
      mouthWide: 0.0,
    );
  }

  FaceState copyWith({
    double? eyeOpen,
    double? eyeBlink,
    double? eyebrowRaise,
    double? mouthOpen,
    double? mouthWide,
  }) {
    return FaceState(
      eyeOpen: eyeOpen ?? this.eyeOpen,
      eyeBlink: eyeBlink ?? this.eyeBlink,
      eyebrowRaise: eyebrowRaise ?? this.eyebrowRaise,
      mouthOpen: mouthOpen ?? this.mouthOpen,
      mouthWide: mouthWide ?? this.mouthWide,
    );
  }
}