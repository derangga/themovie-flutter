import 'package:core/core.dart';
import 'package:movie/src/data/data.dart';
import 'package:movie/src/data/model/movie.dart';

part 'discover_movie_event_state.dart';

class DiscoverMovieBloc
    extends BaseBloc<DiscoverMovieEvent, DiscoverMovieState> {
  final MovieRepository _repository;

  DiscoverMovieBloc(Logger logger, this._repository) : super(logger);

  @override
  Stream<DiscoverMovieState> mapEventToState(DiscoverMovieEvent event) async* {
    if (event is GetDiscoverMovieEvent) {
      var result = await _repository.getDiscoverMovieRemote(1);
      yield* result.fold((failure) async* {
        var localData = await _repository.getDiscoverMoveLocal();
        yield ErrorGetDiscoverMovieState(SingleSourceFailure(
            data: localData, message: 'Error : ${failure.code}'));
      }, (success) async* {
        await _repository.replaceAllDiscoverMovieLocal(success.results);
        yield SuccessGetDiscoverMovieState(success.results);
      });
    }
  }
}
