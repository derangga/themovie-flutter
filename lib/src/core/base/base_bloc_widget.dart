import 'dart:ui';

import 'package:flutter/material.dart';

import '../../di/injection.dart';
import 'base_bloc.dart';
import 'base_event_state.dart';

abstract class BaseBlocWidget<B extends BaseBloc, BS extends BlocState,
    S extends StatefulWidget> extends State<S> {
  final B bloc = getIt.get<B>();

  Widget mapStateHandler(BS state);

  void mapStateBlocListener(BS state) {}

  void executeUiAfterBuild(FrameCallback frameCallback) {
    WidgetsBinding.instance.addPostFrameCallback(frameCallback);
  }
}
