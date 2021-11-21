import 'package:intl/intl.dart';

extension StringExtension on String? {
  String orEmpty() {
    return this ?? '';
  }

  bool toBool() {
    return this?.toLowerCase() == 'true';
  }

  int? toIntorNull() {
    return int.tryParse(this.orEmpty());
  }

  double? toDoubleOrNull() {
    return double.tryParse(this.orEmpty());
  }

  /// For the parameter [formatInput] and [formatOutput] you should declare inside date_format.dart
  String convertDateFormat(String formatInput, String formatOutput) {
    try {
      var date = DateFormat(formatInput).parse(this.orEmpty());
      return DateFormat(formatOutput).format(date);
    } catch (e) {
      return "";
    }
  }
}
