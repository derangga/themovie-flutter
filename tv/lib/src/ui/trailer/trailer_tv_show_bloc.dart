import 'package:core/core.dart';
import '../../data/model/videos.dart';
import '../../data/repository/tv_show_repository.dart';

part 'trailer_tv_show_event_state.dart';

class TrailerTvShowBloc
    extends BaseBloc<TrailerTvShowEvent, TrailerTvShowState> {
  final TvShowRepository _repository;

  TrailerTvShowBloc(Logger logger, this._repository)
      : super(logger, LoadingState());

  @override
  Stream<TrailerTvShowState> mapEventToState(TrailerTvShowEvent event) async* {
    if (event is GetTrailerTvShowEvent) {
      yield LoadingState();
      final result = await _repository.getTvShowTrailer(event.tvShowId);
      yield* result.fold((failure) async* {
        String message = "";
        if (failure.dioError == DioErrorType.RESPONSE) {
          message = "Error ${failure.code} cause ${failure.errorBody}";
        } else
          message = "Network Failure";
        yield ErrorGetTrailerTvShowState(message);
      }, (success) async* {
        yield SuccessGetTrailerTvShowState(success);
      });
    }
  }
}
