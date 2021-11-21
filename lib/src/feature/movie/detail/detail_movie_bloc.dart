import '../../../core/base/base_event_state.dart';
import '../../../data/model/detail_movie_content.dart';
import '../../../core/base/base_bloc.dart';
import '../../../domain/movie_repository.dart';

part 'detail_movie_event_state.dart';

class DetailMovieBloc extends BaseBloc<DetailMovieEvent, DetailMovieState> {
  final MovieRepository? _repository;

  DetailMovieBloc(this._repository) : super(LoadingState());

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
