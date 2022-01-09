import 'package:intl/intl.dart';
import './extension/string_utils.dart';

class DateHelper {
  static const FORMAT_DATE_ISO = "yyyy-MM-dd HH:mm:ss";
  static const FORMAT_YYYY_MM_DD = "yyyy-MM-dd";
  static const FORMAT_DD_MMM_COMMA_YYYY = "dd MMM, yyy";

  static String formatConverter(
      String? date, String formatInput, String outputFormat) {
    try {
      var newFormat = DateFormat(formatInput).parse(date.orEmpty());
      return DateFormat(outputFormat).format(newFormat);
    } catch (e) {
      return "";
    }
  }
}
