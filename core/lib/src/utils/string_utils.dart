extension StringExtension on String {
  String orEmpty() {
    return this ?? '';
  }

  bool toBool() {
    return this.toLowerCase() == 'true';
  }

  int toIntorNull() {
    return int.tryParse(this);
  }

  double toDoubleOrNull() {
    return double.tryParse(this);
  }
}
