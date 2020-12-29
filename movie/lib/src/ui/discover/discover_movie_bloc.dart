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
      var movies = await _getDiscoverMovie();
      if (movies.item1 != null) {
        yield SuccessGetDiscoverMovieState(movies.item1);
      } else
        yield ErrorGetDiscoverMovieState(movies.item2);
    }
  }

  Future<Tuple2<Movies, String>> _getDiscoverMovie() async {
    var result = await _repository.getDiscoverMovie(1);

    switch (result.status) {
      case Status.SUCCESS:
        return Tuple2(result.body, null);
      case Status.ERROR:
        return Tuple2(null, 'Error : ${result.code}');
      default:
        return null;
    }
  }
}
