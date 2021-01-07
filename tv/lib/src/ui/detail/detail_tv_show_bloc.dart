import 'package:core/core.dart';
import 'package:tv/src/data/repository/tv_show_repository.dart';

part 'detail_tv_show_event_state.dart';

class DetailTvShowBloc extends BaseBloc<DetailTvShowEvent, DetailTvShowState> {
  final TvShowRepository _repository;
  DetailTvShowBloc(Logger logger, this._repository) : super(logger);

  @override
  Stream<DetailTvShowState> mapEventToState(DetailTvShowEvent event) async* {
    if (event is GetDetailTvShowEvent) {}
  }
}
