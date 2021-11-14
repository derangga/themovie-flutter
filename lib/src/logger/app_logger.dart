import 'package:logger/logger.dart';

class AppLogger extends Logger {
  AppLogger(
    LogFilter? filter,
    LogPrinter? printer,
    LogOutput? output,
  ) : super(
          filter: filter,
          printer: printer,
          output: output,
          level: Level.debug,
        );
}
