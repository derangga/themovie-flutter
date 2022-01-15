import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_stateful.dart';
import 'package:themovie_flutter/src/feature/home/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState
    extends BaseStateWidget<HomeBloc, HomeState, HomeScreen> {
  @override
  Widget mapStateToWidget(HomeState state) {
    return Container();
  }

  @override
  void setupOnInitState() {}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (ctx, state) => Center(child: Text('Home')),
    );
  }
}
