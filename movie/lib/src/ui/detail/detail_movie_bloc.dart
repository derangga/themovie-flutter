import 'package:core/core.dart';
import '../../data/data.dart';

part 'detail_movie_event_state.dart';

class DetailMovieBloc extends BaseBloc<DetailMovieEvent, DetailMovieState> {
  final MovieRepository _repository;

  DetailMovieBloc(Logger logger, this._repository) : super(logger);

  @override
  Stream<DetailMovieState> mapEventToState(DetailMovieEvent event) async* {}
}
