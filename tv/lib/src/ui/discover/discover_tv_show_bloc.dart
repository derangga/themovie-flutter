import 'package:core/core.dart';
import '../../data/model/tv_show.dart';
import '../../data/repository/tv_show_repository.dart';
import 'package:rxdart/rxdart.dart';

part 'discover_tv_show_event_state.dart';

class DiscoverTvShowBloc
    extends BaseBloc<DiscoverTvShowEvent, DiscoverTvShowState> {
  final TvShowRepository _repository;
  int _page = 1;

  DiscoverTvShowBloc(Logger logger, this._repository) : super(logger, LoadingFirstPageState());

  @override
  Stream<Transition<DiscoverTvShowEvent, DiscoverTvShowState>> transformEvents(
      Stream<DiscoverTvShowEvent> events, transitionFn) {
    return super.transformEvents(
      events.debounceTime(
        Duration(milliseconds: 500),
      ),
      transitionFn,
    );
  }

  @override
  Stream<DiscoverTvShowState> mapEventToState(
      DiscoverTvShowEvent event) async* {
    final currentState = state;
    if (event is GetFirstPageTvShowEvent) {
      _page = event.page;
      yield LoadingFirstPageState();
      final result = await _repository.getDiscoverTvShow(_page);
      yield* result.fold((failure) async* {
        String message;
        if (failure.dioError == DioErrorType.RESPONSE) {
          message = 'Error : ${failure.code}\nCause ${failure.errorBody}';
        } else
          message = 'Network failure';
        yield ErrorGetFirstPageTvShowState(message);
      }, (success) async* {
        _page++;
        yield SuccessGetDiscoverTvShowState(success.data, false);
      });
    } else if (event is GetNextPageTvShowEvent &&
        currentState is SuccessGetDiscoverTvShowState &&
        !_hasReachedMax(currentState)) {
      final result = await _repository.getDiscoverTvShow(_page);
      yield* result.fold((failure) async* {
        String message;
        if (failure.dioError == DioErrorType.RESPONSE) {
          message = 'Error : ${failure.code}\nCause ${failure.errorBody}';
        } else
          message = 'Network failure';
        yield ErrorGetNextPageTvShowState(currentState.tvShows, message);
      }, (success) async* {
        _page++;
        yield success.data.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : SuccessGetDiscoverTvShowState(
                currentState.tvShows + success.data,
                false,
              );
      });
    } else if (event is GetNextPageTvShowEvent &&
        currentState is ErrorGetNextPageTvShowState) {
      final result = await _repository.getDiscoverTvShow(_page);
      yield* result.fold((failure) async* {
        String message;
        if (failure.dioError == DioErrorType.RESPONSE) {
          message = 'Error : ${failure.code}\nCause ${failure.errorBody}';
        } else
          message = 'Network failure';
        yield ErrorGetNextPageTvShowState(currentState.tvShows, message);
      }, (success) async* {
        _page++;
        yield success.data.isEmpty
            ? currentState.copyWith(hasReachedMax: true)
            : SuccessGetDiscoverTvShowState(
                currentState.tvShows + success.data,
                false,
              );
      });
    }
  }

  bool _hasReachedMax(DiscoverTvShowState state) =>
      state is SuccessGetDiscoverTvShowState && state.hasReachedMax;
}
