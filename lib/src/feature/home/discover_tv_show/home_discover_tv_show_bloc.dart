import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_bloc.dart';
import 'package:themovie_flutter/src/domain/tv_show_repository.dart';
import 'package:themovie_flutter/src/feature/home/home_event_state.dart';
import 'package:themovie_flutter/src/usecase/tv_show/get_discover_tv_show_usecase.dart';

class HomeDiscoverTvShowBloc extends BaseBloc<HomeEvent, HomeState> {
  final TvShowRepository _repository;

  HomeDiscoverTvShowBloc(this._repository) : super(LoadingState()) {
    on<HomeEvent>(_fetchDiscoverTvShow);
  }

  Future<void> _fetchDiscoverTvShow(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (event is GetDiscoverTvShowEvent) {
      emit(LoadingState());

      final result = await _getDiscoverTvShow(1);

      result.fold((failure) {
        emit(FailedGetTvShowState(failure.message));
      }, (response) {
        emit(SuccessGetTvShowState(response));
      });
    } else if (event is InitialEvent) {
      emit(LoadingState());
    }
  }

  GetDiscoverTvShowUseCase get _getDiscoverTvShow =>
      GetDiscoverTvShowUseCase(_repository);
}
