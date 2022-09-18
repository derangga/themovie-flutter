import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_bloc.dart';
import 'base_event_state.dart';

abstract class BaseMultiBlocWidget<B extends BaseBloc, BS extends BlocState,
    S extends StatefulWidget> extends State<S> {
  Widget mapStateHandler(BS state);

  void mapStateBlocListener(BS state) {}

  late B bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<B>(context);
  }
}
