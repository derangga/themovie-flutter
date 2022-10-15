import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/config/failure.dart';
import '../../../data/model/movie.dart';
import '../../../data/remote/movie_remote_source.dart';
import '../../../navigation/movie/movie_navigation.dart';
import '../../../usecase/movie/get_upcoming_movie_usecase.dart';
import '../../../utils/bloc_throttle.dart';

part 'upcoming_movie_event_state.dart';

class UpcomingMovieBloc extends Bloc<UpcomingMovieEvent, UpcomingMovieState> {
  final MovieRemoteSource _remoteSource;
  final MovieNavigation _movieNavigation;
  int _page = 1;
  UpcomingMovieBloc(
    this._remoteSource,
    this._movieNavigation,
  ) : super(UpcomingMovieState()) {
    on<UpcomingMovieEvent>(
      _fetchDiscoverMovie,
      transformer: throttleDroppable(Duration(milliseconds: 500)),
    );
  }

  GetUpcomingMovieUseCase get _getUpcomingMovie =>
      GetUpcomingMovieUseCase(_remoteSource);

  Future<void> _fetchDiscoverMovie(
    UpcomingMovieEvent event,
    Emitter<UpcomingMovieState> emit,
  ) async {
    if (state.hasReachedMax) return;

    if (event is GetFirstPageMovieEvent) {
      _page = event.page;
      emit(UpcomingMovieState());
      final result = await _getUpcomingMovie(_page);
      _onGetFirstPage(emit, result);
    } else if (event is GetNextPageMovieEvent) {
      emit(state.copyWith(status: UpcomingMovieStatus.LOADING));
      final result = await _getUpcomingMovie(_page);
      _onGetNextPage(emit, result);
    }
  }

  void _onGetFirstPage(
    Emitter<UpcomingMovieState> emit,
    Either<Failure, List<Movie>> result,
  ) {
    result.fold((error) {
      emit(state.copyWith(
        status: UpcomingMovieStatus.FAILED,
        errorMessage: '${error.code}: ${error.errorBody}',
      ));
    }, (response) {
      _page++;
      emit(state.copyWith(
        status: UpcomingMovieStatus.SUCCESS,
        movies: response,
        hasReachedMax: false,
      ));
    });
  }

  void _onGetNextPage(
    Emitter<UpcomingMovieState> emit,
    Either<Failure, List<Movie>> result,
  ) {
    result.fold((error) {
      emit(state.copyWith(
        status: UpcomingMovieStatus.FAILED,
        errorMessage: '${error.code}: ${error.errorBody}',
        hasReachedMax: false,
      ));
    }, (response) {
      if (response.isNotEmpty) {
        _page++;
        emit(state.copyWith(
          status: UpcomingMovieStatus.SUCCESS,
          movies: List.of(state.movies)..addAll(response),
          hasReachedMax: false,
        ));
      } else {
        emit(state.copyWith(
          status: UpcomingMovieStatus.SUCCESS,
          hasReachedMax: true,
        ));
      }
    });
  }

  bool isOnLoadingOrFailed() {
    return state.status == UpcomingMovieStatus.LOADING ||
        state.status == UpcomingMovieStatus.FAILED;
  }

  void goToDetailMovie(BuildContext context, int movieId) {
    _movieNavigation.goToDetailMovie(context, movieId);
  }
}
