import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logger/app_logger.dart';

import 'base_event_state.dart';

abstract class BaseBloc<Event extends BlocEvent, State extends BlocState>
    extends Bloc<Event, State> {
  late AppLogger _logger;

  BaseBloc(this._logger, State initialState) : super(initialState);

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
