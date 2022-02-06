import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_bloc.dart';
import 'package:themovie_flutter/src/feature/home/home_event_state.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitialState()) {
    on<HomeEvent>(_homeEvent);
  }

  Future<void> _homeEvent(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (event is InitialEvent) {
      emit(InitialState());
    } else if (event is ErrorHomeEvent) {
      emit(ShowHomeErrorState());
    }
  }
}
