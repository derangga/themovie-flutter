import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/base_bloc.dart';
import '../../../data/remote/movie_remote_source.dart';
import '../../../navigation/movie/movie_navigation.dart';
import '../../../usecase/movie/get_upcoming_movie_usecase.dart';
import '../home_event_state.dart';

class HomeUpcomingMovieBloc extends BaseBloc<HomeEvent, HomeState> {
  final MovieRemoteSource _remoteSource;
  final MovieNavigation _navigation;
  HomeUpcomingMovieBloc(
    this._remoteSource,
    this._navigation,
  ) : super(LoadingState()) {
    on<HomeEvent>(_fetchUpcomingMovie);
  }

  Future<void> _fetchUpcomingMovie(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (event is GetUpcomingMovieEvent) {
      emit(LoadingState());

      final result = await _getUpcomingMovie(1);

      result.fold((failure) {
        emit(FailedGetMovieState(failure.message));
      }, (response) {
        emit(SuccessGetMovieState(response));
      });
    } else if (event is InitialEvent) {
      emit(LoadingState());
    }
  }

  GetUpcomingMovieUseCase get _getUpcomingMovie =>
      GetUpcomingMovieUseCase(_remoteSource);

  void goToUpcomingMovie(BuildContext context) {
    _navigation.goToUpcomingMovie(context);
  }

  void goToDetailMovie(BuildContext context, int movieId) {
    _navigation.goToDetailMovie(context, movieId);
  }
}
