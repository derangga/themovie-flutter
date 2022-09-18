import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/base_bloc.dart';
import '../../../data/remote/movie_remote_source.dart';
import '../../../navigation/movie/movie_navigation.dart';
import '../../../usecase/movie/get_discover_movies_usecase.dart';
import '../home_event_state.dart';

class HomeDiscoverMovieBloc extends BaseBloc<HomeEvent, HomeState> {
  final MovieRemoteSource _remoteSource;
  final MovieNavigation _navigation;
  HomeDiscoverMovieBloc(
    this._remoteSource,
    this._navigation,
  ) : super(LoadingState()) {
    on<HomeEvent>(_fetchDiscoverMovie);
  }

  Future<void> _fetchDiscoverMovie(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (event is GetDiscoverMovieEvent) {
      emit(LoadingState());

      final result = await _getDiscoverMovie(1);

      result.fold((failure) {
        emit(FailedGetTvShowState(failure.message));
      }, (response) {
        emit(SuccessGetMovieState(response));
      });
    } else if (event is InitialEvent) {
      emit(LoadingState());
    }
  }

  GetDiscoverMovieUseCase get _getDiscoverMovie =>
      GetDiscoverMovieUseCase(_remoteSource);

  void goToDiscoverMovie(BuildContext context) {
    _navigation.goToDiscoverMovie(context);
  }

  void goToDetailMovie(BuildContext context, int movieId) {
    _navigation.goToDetailMovie(context, movieId);
  }
}
