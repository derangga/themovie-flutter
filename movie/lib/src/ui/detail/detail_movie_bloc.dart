import 'package:core/core.dart';
import '../../data/data.dart';

part 'detail_movie_event_state.dart';

class DetailMovieBloc extends BaseBloc<DetailMovieEvent, DetailMovieState> {
  final MovieRepository _repository;

  DetailMovieBloc(this._repository) : super(null);

  @override
  Stream<DetailMovieState> mapEventToState(DetailMovieEvent event) async* {}
}
