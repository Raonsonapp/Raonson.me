enum Phoneme {
  a,
  e,
  i,
  o,
  u,
  m,
  b,
  p,
  f,
  s,
  rest,
}

extension PhonemeExt on Phoneme {
  int get frameIndex {
    switch (this) {
      case Phoneme.a:
        return 0;
      case Phoneme.e:
        return 1;
      case Phoneme.i:
        return 2;
      case Phoneme.o:
        return 3;
      case Phoneme.u:
        return 4;
      case Phoneme.m:
        return 5;
      case Phoneme.b:
        return 6;
      case Phoneme.p:
        return 7;
      case Phoneme.f:
        return 8;
      case Phoneme.s:
        return 9;
      case Phoneme.rest:
        return 10;
    }
  }
}