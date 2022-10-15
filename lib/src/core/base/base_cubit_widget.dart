import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/injection.dart';

abstract class BaseCubitWidget<B extends Cubit, BS, S extends StatefulWidget>
    extends State<S> {
  final B bloc = getIt.get<B>();

  Widget mapStateHandler(BS state);

  void mapStateBlocListener(BS state) {}

  void executeUiAfterBuild(FrameCallback frameCallback) {
    WidgetsBinding.instance.addPostFrameCallback(frameCallback);
  }
}
