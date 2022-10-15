import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/api_state.dart';
import 'package:themovie_flutter/src/data/remote/trending_remote_source.dart';
import 'package:themovie_flutter/src/usecase/trending/get_trending_movie_usecase.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';

import '../../../navigation/movie/movie_navigation.dart';
import 'home_trending_movie_state.dart';

class HomeTrendingMovieBloc extends Cubit<HomeTrendingMovieState> {
  final TrendingRemoteSource _remoteSouce;
  final MovieNavigation _navigation;
  HomeTrendingMovieBloc(
    this._remoteSouce,
    this._navigation,
  ) : super(HomeTrendingMovieState());

  Future<void> fetchTrendingMovie() async {
    emit(state.copyWith(apiState: ApiState.LOADING));

    final result = await _getTrendingMovie(NoParams());

    result.fold((failure) {
      emit(state.copyWith(
        apiState: ApiState.FAILED,
        errorMessage: failure.message,
      ));
    }, (moviesResponse) {
      bool isMoreOrEqSixContent = moviesResponse.length >= 6;
      if (isMoreOrEqSixContent) {
        final movies = moviesResponse.sublist(0, 6);
        emit(state.copyWith(
          apiState: ApiState.SUCCESS,
          movies: movies,
        ));
      } else {
        emit(state.copyWith(
          apiState: ApiState.SUCCESS,
          movies: moviesResponse,
        ));
      }
    });
  }

  void updateCarouselIndicator(int position) {
    emit(state.copyWith(carouselPos: position));
  }

  GetTrendingMovieUseCase get _getTrendingMovie =>
      GetTrendingMovieUseCase(_remoteSouce);

  void goToTrendingMovie(BuildContext context) {
    _navigation.goToTrendingMovie(context);
  }

  void goToDetailMovie(BuildContext context, int movieId) {
    _navigation.goToDetailMovie(context, movieId);
  }
}
