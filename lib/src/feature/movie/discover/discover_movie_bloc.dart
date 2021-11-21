import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/config/failure.dart';
import '../../../utils/bloc_throttle.dart';
import '../../../core/base/base_event_state.dart';
import '../../../data/model/movie.dart';
import '../../../domain/movie_repository.dart';
import '../../../core/base/base_bloc.dart';

part 'discover_movie_event_state.dart';

class DiscoverMovieBloc
    extends BaseBloc<DiscoverMovieEvent, DiscoverMovieState> {
  final MovieRepository _repository;
  int _page = 1;

  DiscoverMovieBloc(this._repository) : super(DiscoverMovieState()) {
    on<DiscoverMovieEvent>(
      _fetchDiscoverMovie,
      transformer: throttleDroppable(Duration(milliseconds: 500)),
    );
  }

  Future<void> _fetchDiscoverMovie(
    DiscoverMovieEvent event,
    Emitter<DiscoverMovieState> emit,
  ) async {
    if (state.hasReachedMax) return;

    if (event is GetFirstPageMovieEvent) {
      _page = event.page;
      emit(DiscoverMovieState());
      final result = await _repository.getDiscoverMovieRemote(_page);
      _onGetFirstPage(emit, result);
    } else if (event is GetNextPageMovieEvent) {
      emit(state.copyWith(status: DiscoverMoviesStatus.LOADING));
      final result = await _repository.getDiscoverMovieRemote(_page);
      _onGetNextPage(emit, result);
    }
  }

  void _onGetFirstPage(
    Emitter<DiscoverMovieState> emit,
    Either<Failure, List<Movie>> result,
  ) {
    result.fold((error) {
      emit(state.copyWith(
        status: DiscoverMoviesStatus.FAILED,
        errorMessage: '${error.code}: ${error.errorBody}',
      ));
    }, (response) {
      _page++;
      emit(state.copyWith(
        status: DiscoverMoviesStatus.SUCCESS,
        movies: response,
        hasReachedMax: false,
      ));
    });
  }

  void _onGetNextPage(
    Emitter<DiscoverMovieState> emit,
    Either<Failure, List<Movie>> result,
  ) {
    result.fold((error) {
      emit(state.copyWith(
        status: DiscoverMoviesStatus.FAILED,
        errorMessage: '${error.code}: ${error.errorBody}',
        hasReachedMax: false,
      ));
    }, (response) {
      if (response.isNotEmpty) {
        _page++;
        emit(state.copyWith(
          status: DiscoverMoviesStatus.SUCCESS,
          movies: List.of(state.movies)..addAll(response),
          hasReachedMax: false,
        ));
      } else {
        emit(state.copyWith(
          status: DiscoverMoviesStatus.SUCCESS,
          hasReachedMax: true,
        ));
      }
    });
  }

  bool isOnLoadingOrFailed() {
    return state.status == DiscoverMoviesStatus.LOADING ||
        state.status == DiscoverMoviesStatus.FAILED;
  }
}
