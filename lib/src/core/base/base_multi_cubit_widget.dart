import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseMultiCubitWidget<B extends Cubit, BS,
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
