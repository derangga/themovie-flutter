import 'package:core/core.dart';
import 'package:tv/src/data/model/detail_tv_show_content.dart';
import 'package:tv/src/data/repository/tv_show_repository.dart';

part 'detail_tv_show_event_state.dart';

class DetailTvShowBloc extends BaseBloc<DetailTvShowEvent, DetailTvShowState> {
  final TvShowRepository _repository;
  DetailTvShowBloc(Logger logger, this._repository)
      : super(logger, LoadingState());

  @override
  Stream<DetailTvShowState> mapEventToState(DetailTvShowEvent event) async* {
    if (event is GetDetailTvShowEvent) {
      yield LoadingState();
      final result = await _repository.getDetailTvShowContent(event.tvShowId);
      yield* result.fold((failure) async* {
        yield ErrorGetDetailTvShowState('${failure.message}');
      }, (success) async* {
        yield SuccessGetDetailTvShowState(success);
      });
    }
  }
}
