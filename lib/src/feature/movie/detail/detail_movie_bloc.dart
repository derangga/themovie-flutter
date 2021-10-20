import 'package:logger/logger.dart';
import 'package:themovie_flutter/src/core/base/base_event_state.dart';
import 'package:themovie_flutter/src/data/model/detail_movie_content.dart';
import '../../../core/base/base_bloc.dart';
import '../../../domain/movie_repository.dart';

part 'detail_movie_event_state.dart';

class DetailMovieBloc extends BaseBloc<DetailMovieEvent, DetailMovieState> {
  final MovieRepository _repository;

  DetailMovieBloc(Logger logger, this._repository) : super(logger);

  @override
  Stream<DetailMovieState> mapEventToState(DetailMovieEvent event) async* {
    if (event is GetDetailMovieEvent) {
      yield LoadingState();
      final result = await _repository.getDetailMovieRemote(event.movieId);

      yield* result.fold((failure) async* {
        yield ErrorGetDetailMovie(failure.message);
      }, (success) async* {
        yield SuccessGetDetailMovie(success);
      });
    }
  }
}
