import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/api_state.dart';
import '../../../data/remote/source/movie_remote_source.dart';
import '../../../navigation/movie/movie_navigation.dart';
import '../../../usecase/movie/get_upcoming_movie_usecase.dart';
import 'home_upcoming_movie_state.dart';

class HomeUpcomingMovieBloc extends Cubit<HomeUpcomingMovieState> {
  final MovieRemoteSource _remoteSource;
  final MovieNavigation _navigation;
  HomeUpcomingMovieBloc(
    this._remoteSource,
    this._navigation,
  ) : super(HomeUpcomingMovieState());

  Future<void> fetchUpcomingMovie() async {
    emit(state.copyWith(apiState: ApiState.LOADING));

    final result = await _getUpcomingMovie(1);

    result.fold((failure) {
      emit(state.copyWith(
        apiState: ApiState.FAILED,
        errorMessage: failure.message,
      ));
    }, (moviesResponse) {
      emit(state.copyWith(
        apiState: ApiState.SUCCESS,
        movies: moviesResponse,
      ));
    });
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
