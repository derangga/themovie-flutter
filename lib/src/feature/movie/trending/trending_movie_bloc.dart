import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/api_state.dart';
import '../../../data/model/movie.dart';
import '../../../data/remote/source/trending_remote_source.dart';
import '../../../navigation/movie/movie_navigation.dart';
import '../../../usecase/trending/get_trending_movie_usecase.dart';
import '../../../usecase/usecase.dart';

part 'trending_movie_state.dart';

class TrendingMovieBloc extends Cubit<TrendingMovieState> {
  final TrendingRemoteSource _remoteSouce;
  final MovieNavigation _movieNavigation;

  TrendingMovieBloc(
    this._remoteSouce,
    this._movieNavigation,
  ) : super(TrendingMovieState());

  GetTrendingMovieUseCase get _getTrendingMovie =>
      GetTrendingMovieUseCase(_remoteSouce);

  Future<void> fetchTrendingMovie() async {
    emit(state.copyWith(apiState: ApiState.LOADING));

    final result = await _getTrendingMovie(NoParams());

    result.fold((failure) {
      emit(state.copyWith(
        apiState: ApiState.FAILED,
        errorMessage: failure.message,
      ));
    }, (movieResponse) {
      emit(state.copyWith(
        apiState: ApiState.SUCCESS,
        movies: movieResponse,
      ));
    });
  }

  void goToDetailMovie(BuildContext context, int movieId) {
    _movieNavigation.goToDetailMovie(context, movieId);
  }
}
