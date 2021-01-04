import 'package:logger/logger.dart';

abstract class BaseRepository {
  final Logger _logger;

  BaseRepository(this._logger) : assert(_logger != null);

  void logDebug(String message) {
    _logger.d("$runtimeType : $message");
  }

  void logInfo(String message) {
    _logger.i("$runtimeType : $message");
  }

  void logError(String message) {
    _logger.e("$runtimeType : $message");
  }

  void logWarning(String message) {
    _logger.w("$runtimeType : $message");
  }
}
