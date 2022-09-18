import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/data/remote/movie_remote_source.dart';
import 'package:themovie_flutter/src/navigation/movie/movie_navigation.dart';
import 'package:themovie_flutter/src/usecase/movie/get_detail_movie_usecase.dart';
import '../../../core/base/base_event_state.dart';
import '../../../data/model/detail_movie_content.dart';
import '../../../core/base/base_bloc.dart';

part 'detail_movie_event_state.dart';

class DetailMovieBloc extends BaseBloc<DetailMovieEvent, DetailMovieState> {
  final MovieRemoteSource _remoteSource;
  final MovieNavigation _movieNavigation;

  DetailMovieBloc(this._remoteSource, this._movieNavigation)
      : super(LoadingState()) {
    on<DetailMovieEvent>(_fetchDetailMovie);
  }

  Future<void> _fetchDetailMovie(
    DetailMovieEvent event,
    Emitter<DetailMovieState> emit,
  ) async {
    if (event is GetDetailMovieEvent) {
      emit(LoadingState());

      final result = await _getDetailMovie(event.movieId);

      result.fold((failure) {
        emit(ErrorGetDetailMovie(failure.message));
      }, (success) {
        emit(SuccessGetDetailMovie(success));
      });
    }
  }

  void goToTrailerScreen(BuildContext context, int movieId) {
    _movieNavigation.goToTrailerMovie(context, movieId);
  }

  void goToDetailMovieScreen(BuildContext context, int movieId) {
    _movieNavigation.goToDetailMovie(context, movieId);
  }

  GetDetailMovieUseCase get _getDetailMovie =>
      GetDetailMovieUseCase(_remoteSource);
}
