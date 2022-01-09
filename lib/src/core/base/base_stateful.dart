import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:themovie_flutter/src/logger/app_logger.dart';

import 'base_bloc.dart';
import 'base_event_state.dart';

abstract class BaseState<BlocApp extends BaseBloc, StateApp extends BlocState,
    S extends StatefulWidget> extends State<S> {
  void setupOnInitState();
  Widget mapStateToWidget(StateApp state);

  late BlocApp bloc;
  AppLogger _logger = KiwiContainer().resolve<AppLogger>('AppLogger');

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<BlocApp>(context);
    setupOnInitState();
  }

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

  void executeUiAfterBuild(FrameCallback frameCallback) {
    WidgetsBinding.instance!.addPostFrameCallback(frameCallback);
  }
}
