import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/base_bloc.dart';
import '../../../core/base/base_event_state.dart';
import '../../../data/model/movie.dart';
import '../../../data/remote/trending_remote_source.dart';
import '../../../navigation/movie/movie_navigation.dart';
import '../../../usecase/trending/get_trending_movie_usecase.dart';
import '../../../usecase/usecase.dart';

part 'trending_movie_event_state.dart';

class TrendingMovieBloc
    extends BaseBloc<TrendingMovieEvent, TrendingMovieState> {
  final TrendingRemoteSource _remoteSouce;
  final MovieNavigation _movieNavigation;

  TrendingMovieBloc(
    this._remoteSouce,
    this._movieNavigation,
  ) : super(LoadingState()) {
    on<TrendingMovieEvent>(_fetchTrendingMovie);
  }

  GetTrendingMovieUseCase get _getTrendingMovie =>
      GetTrendingMovieUseCase(_remoteSouce);

  Future<void> _fetchTrendingMovie(
    TrendingMovieEvent event,
    Emitter<TrendingMovieState> emit,
  ) async {
    if (event is GetTrendingMovieEvent) {
      emit(LoadingState());

      final result = await _getTrendingMovie(NoParams());

      result.fold((failure) {
        emit(FailedGetMovieState(failure.message));
      }, (response) {
        emit(SuccessGetMovieState(response));
      });
    }
  }

  void goToDetailMovie(BuildContext context, int movieId) {
    _movieNavigation.goToDetailMovie(context, movieId);
  }
}
