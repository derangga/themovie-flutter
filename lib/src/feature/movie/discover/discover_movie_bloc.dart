import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';
import '../../../core/base/base_event_state.dart';
import '../../../data/model/movie.dart';
import '../../../domain/movie_repository.dart';
import '../../../core/base/base_bloc.dart';

part 'discover_movie_event_state.dart';

class DiscoverMovieBloc
    extends BaseBloc<DiscoverMovieEvent, DiscoverMovieState> {
  final MovieRepository _repository;
  int _page = 1;

  DiscoverMovieBloc(Logger logger, this._repository)
      : super(logger, LoadingFirstPageState());

  @override
  Stream<Transition<DiscoverMovieEvent, DiscoverMovieState>> transformEvents(
      Stream<DiscoverMovieEvent> events, transitionFn) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 500),
      ),
      transitionFn,
    );
  }

  @override
  Stream<DiscoverMovieState> mapEventToState(DiscoverMovieEvent event) async* {
    final currentState = state;
    if (event is GetFirstPageMovieEvent) {
      _page = event.page;
      yield LoadingFirstPageState();
      final result = await _repository.getDiscoverMovieRemote(_page);
      yield* result.fold((failure) async* {
        String message;
        if (failure.dioError == DioErrorType.RESPONSE) {
          message = 'Error : ${failure.code}\nCause ${failure.errorBody}';
        } else
          message = 'Network failure';
        yield ErrorGetFirstPageMovieState(message);
      }, (success) async* {
        _page++;
        yield SuccessGetDiscoverMovieState(success, false);
      });
    } else if (event is GetNextPageMovieEvent &&
        currentState is SuccessGetDiscoverMovieState &&
        !_hasReachedMax(currentState)) {
      final result = await _repository.getDiscoverMovieRemote(_page);
      yield* result.fold((failure) async* {
        String message;
        if (failure.dioError == DioErrorType.RESPONSE) {
          message = 'Error : ${failure.code}\nCause ${failure.errorBody}';
        } else
          message = 'Network failure';
        yield ErrorGetNextPageMovieState(currentState.movies, message);
      }, (success) async* {
        _page++;
        yield success.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : SuccessGetDiscoverMovieState(
                currentState.movies + success,
                false,
              );
      });
    } else if (event is GetNextPageMovieEvent &&
        currentState is ErrorGetNextPageMovieState) {
      final result = await _repository.getDiscoverMovieRemote(_page);
      yield* result.fold((failure) async* {
        String message;
        if (failure.dioError == DioErrorType.RESPONSE) {
          message = 'Error : ${failure.code}\nCause ${failure.errorBody}';
        } else
          message = 'Network failure';
        yield ErrorGetNextPageMovieState(currentState.movies, message);
      }, (success) async* {
        _page++;
        yield success.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : SuccessGetDiscoverMovieState(
                currentState.movies + success,
                false,
              );
      });
    }
  }

  bool _hasReachedMax(DiscoverMovieState state) =>
      state is SuccessGetDiscoverMovieState && state.hasReachedMax;
}
