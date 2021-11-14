import '../../../core/base/base_event_state.dart';
import '../../../data/model/detail_movie_content.dart';
import '../../../logger/app_logger.dart';
import '../../../core/base/base_bloc.dart';
import '../../../domain/movie_repository.dart';

part 'detail_movie_event_state.dart';

class DetailMovieBloc extends BaseBloc<DetailMovieEvent, DetailMovieState> {
  final MovieRepository? _repository;

  DetailMovieBloc(AppLogger logger, this._repository)
      : super(logger, LoadingState());

  @override
  Stream<DetailMovieState> mapEventToState(DetailMovieEvent event) async* {
    if (event is GetDetailMovieEvent) {
      yield LoadingState();
      final result = await _repository!.getDetailMovieRemote(event.movieId);

      yield* result.fold((failure) async* {
        yield ErrorGetDetailMovie(failure!.message);
      }, (success) async* {
        yield SuccessGetDetailMovie(success);
      });
    }
  }
}
