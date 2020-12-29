import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:logger/logger.dart';

import 'base_bloc.dart';
import 'base_event_state.dart';

abstract class BaseState<BlocApp extends BaseBloc, StateApp extends BlocState,
    S extends StatefulWidget> extends State<S> {
  Widget mapStateToWidget(StateApp state);

  BlocApp bloc;
  Logger _logger = KiwiContainer().resolve<Logger>();

  void setupOnInitState();

  BlocApp provideBloc();

  @override
  void initState() {
    super.initState();
    bloc = provideBloc();
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
    WidgetsBinding.instance.addPostFrameCallback(frameCallback);
  }
}
