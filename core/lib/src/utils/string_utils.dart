extension StringExtension on String {
  String orEmpty() {
    return this ?? '';
  }

  bool parseBool() {
    return this.toLowerCase() == 'true';
  }
}
