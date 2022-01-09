import 'package:themovie_flutter/src/usecase/movie/get_detail_movie_usecase.dart';

import '../../../core/base/base_event_state.dart';
import '../../../data/model/detail_movie_content.dart';
import '../../../core/base/base_bloc.dart';
import '../../../domain/movie_repository.dart';

part 'detail_movie_event_state.dart';

class DetailMovieBloc extends BaseBloc<DetailMovieEvent, DetailMovieState> {
  final MovieRepository _repository;

  DetailMovieBloc(this._repository) : super(LoadingState());

  @override
  Stream<DetailMovieState> mapEventToState(DetailMovieEvent event) async* {
    if (event is GetDetailMovieEvent) {
      yield LoadingState();

      final result = await _getDetailMovie(event.movieId);

      yield* result.fold((failure) async* {
        yield ErrorGetDetailMovie(failure.message);
      }, (success) async* {
        yield SuccessGetDetailMovie(success);
      });
    }
  }

  GetDetailMovieUseCase get _getDetailMovie =>
      GetDetailMovieUseCase(_repository);
}
