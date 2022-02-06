import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_event_state.dart';
import 'package:themovie_flutter/src/data/model/movie.dart';
import 'package:themovie_flutter/src/data/remote/trending_remote_source.dart';
import 'package:themovie_flutter/src/usecase/trending/get_trending_movie_usecase.dart';
import 'package:themovie_flutter/src/usecase/usecase.dart';

part 'trending_movie_event_state.dart';

class TrendingMovieBloc
    extends BaseBloc<TrendingMovieEvent, TrendingMovieState> {
  final TrendingRemoteSouce _remoteSouce;
  TrendingMovieBloc(this._remoteSouce) : super(LoadingState()) {
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
}
