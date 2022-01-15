import 'package:themovie_flutter/src/core/base/base_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_event_state.dart';

part 'home_event_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitialState());
}
