extension IntegerExtension on int? {
  int orZero() {
    return this ?? 0;
  }
}

extension DoubleExtension on double? {
  double orZero() {
    return this ?? 0.0;
  }
}
