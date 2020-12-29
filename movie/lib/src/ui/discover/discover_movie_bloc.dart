import 'package:core/core.dart';
import 'package:movie/src/data/data.dart';
import 'package:movie/src/data/model/movie.dart';

part 'discover_movie_event_state.dart';

class DiscoverMovieBloc
    extends BaseBloc<DiscoverMovieEvent, DiscoverMovieState> {
  final MovieRepository _repository;

  DiscoverMovieBloc(this._repository) : super(null);

  @override
  Stream<DiscoverMovieState> mapEventToState(DiscoverMovieEvent event) async* {
    if (event is GetDiscoverMovieEvent) {
      var result = await _repository.getDiscoverMovie(1);
      yield* result.fold((l) async* {
        yield ErrorGetDiscoverMovieState('Error : ${l.code}');
      }, (r) async* {
        yield SuccessGetDiscoverMovieState(r);
      });
    }
  }
}
