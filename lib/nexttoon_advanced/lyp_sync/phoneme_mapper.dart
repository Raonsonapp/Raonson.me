import 'phoneme.dart';

class PhonemeMapper {
  static Phoneme mapChar(String char) {
    switch (char.toLowerCase()) {
      case 'a':
        return Phoneme.a;
      case 'e':
        return Phoneme.e;
      case 'i':
        return Phoneme.i;
      case 'o':
        return Phoneme.o;
      case 'u':
        return Phoneme.u;
      case 'm':
        return Phoneme.m;
      case 'b':
        return Phoneme.b;
      case 'p':
        return Phoneme.p;
      case 'f':
        return Phoneme.f;
      case 's':
        return Phoneme.s;
      default:
        return Phoneme.rest;
    }
  }
}