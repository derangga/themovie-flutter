extension IntegerExtension on int {
  int orZero() {
    return this != null ? this : 0;
  }
}

extension DoubleExtension on double {
  double orZero() {
    return this != null ? this : 0.0;
  }
}
