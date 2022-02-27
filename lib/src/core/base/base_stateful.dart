import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_bloc.dart';
import 'base_event_state.dart';

abstract class BaseStateWidget<BlocApp extends BaseBloc,
    StateApp extends BlocState, S extends StatefulWidget> extends State<S> {
  void setupOnInitState();
  Widget mapStateToWidget(StateApp state);

  late BlocApp bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<BlocApp>(context);
    setupOnInitState();
  }

  void executeUiAfterBuild(FrameCallback frameCallback) {
    WidgetsBinding.instance?.addPostFrameCallback(frameCallback);
  }
}
