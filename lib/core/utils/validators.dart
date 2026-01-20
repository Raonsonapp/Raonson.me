class Validators {
  static bool isEmail(String value) =>
      value.contains('@') && value.contains('.');
}