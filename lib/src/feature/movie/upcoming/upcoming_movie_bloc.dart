import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_bloc.dart';
import 'package:themovie_flutter/src/core/base/base_event_state.dart';
import 'package:themovie_flutter/src/data/config/failure.dart';
import 'package:themovie_flutter/src/data/model/movie.dart';
import 'package:themovie_flutter/src/domain/movie_repository.dart';
import 'package:themovie_flutter/src/usecase/movie/get_upcoming_movie_usecase.dart';
import 'package:themovie_flutter/src/utils/bloc_throttle.dart';

part 'upcoming_movie_event_state.dart';

class UpcomingMovieBloc
    extends BaseBloc<UpcomingMovieEvent, UpcomingMovieState> {
  final MovieRepository _repository;
  int _page = 1;
  UpcomingMovieBloc(this._repository) : super(UpcomingMovieState()) {
    on<UpcomingMovieEvent>(
      _fetchDiscoverMovie,
      transformer: throttleDroppable(Duration(milliseconds: 500)),
    );
  }

  GetUpcomingMovieUseCase get _getUpcomingMovie =>
      GetUpcomingMovieUseCase(_repository);

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
}
