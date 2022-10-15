import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/api_state.dart';

import '../../../data/remote/source/movie_remote_source.dart';
import '../../../navigation/movie/movie_navigation.dart';
import '../../../usecase/movie/get_discover_movies_usecase.dart';
import 'home_discover_movie_state.dart';

class HomeDiscoverMovieBloc extends Cubit<HomeDiscoverMovieState> {
  final MovieRemoteSource _remoteSource;
  final MovieNavigation _navigation;
  HomeDiscoverMovieBloc(
    this._remoteSource,
    this._navigation,
  ) : super(HomeDiscoverMovieState());

  Future<void> fetchDiscoverMovie() async {
    emit(state.copyWith(apiState: ApiState.LOADING));

    final result = await _getDiscoverMovie(1);

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

  GetDiscoverMovieUseCase get _getDiscoverMovie =>
      GetDiscoverMovieUseCase(_remoteSource);

  void goToDiscoverMovie(BuildContext context) {
    _navigation.goToDiscoverMovie(context);
  }

  void goToDetailMovie(BuildContext context, int movieId) {
    _navigation.goToDetailMovie(context, movieId);
  }
}
