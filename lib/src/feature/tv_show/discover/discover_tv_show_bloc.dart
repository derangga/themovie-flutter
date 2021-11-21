import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/config/failure.dart';
import '../../../logger/app_logger.dart';
import '../../../utils/bloc_throttle.dart';
import '../../../core/base/base_bloc.dart';
import '../../../core/base/base_event_state.dart';
import '../../../domain/tv_show_repository.dart';
import '../../../data/model/tv_show.dart';

part 'discover_tv_show_event_state.dart';

class DiscoverTvShowBloc
    extends BaseBloc<DiscoverTvShowEvent, DiscoverTvShowState> {
  final TvShowRepository _repository;
  int _page = 1;

  DiscoverTvShowBloc(AppLogger logger, this._repository)
      : super(logger, DiscoverTvShowState()) {
    on<DiscoverTvShowEvent>(
      _fetchDiscoverTvShow,
      transformer: throttleDroppable(Duration(milliseconds: 500)),
    );
  }

  Future<void> _fetchDiscoverTvShow(
    DiscoverTvShowEvent event,
    Emitter<DiscoverTvShowState> emit,
  ) async {
    if (state.hasReachedMax) return;

    if (event is GetFirstPageTvShowEvent) {
      emit(state.copyWith());

      final result = await _repository.getDiscoverTvShow(_page);

      _onGetFirstPage(emit, result);
    } else if (event is GetNextPageTvShowEvent) {
      emit(state.copyWith(status: DiscoverTvShowStatus.LOADING));

      final result = await _repository.getDiscoverTvShow(_page);

      _onGetNextPage(emit, result);
    }
  }

  void _onGetFirstPage(
    Emitter<DiscoverTvShowState> emit,
    Either<Failure, List<TvShow>> result,
  ) {
    result.fold((error) {
      emit(state.copyWith(
        status: DiscoverTvShowStatus.FAILED,
        errorMessage: '${error.code}: ${error.errorBody}',
      ));
    }, (response) {
      _page++;
      emit(state.copyWith(
        status: DiscoverTvShowStatus.SUCCESS,
        tvShows: response,
        hasReachedMax: false,
      ));
    });
  }

  void _onGetNextPage(
    Emitter<DiscoverTvShowState> emit,
    Either<Failure, List<TvShow>> result,
  ) {
    result.fold((error) {
      emit(state.copyWith(
        status: DiscoverTvShowStatus.FAILED,
        errorMessage: '${error.code}: ${error.errorBody}',
        hasReachedMax: false,
      ));
    }, (response) {
      if (response.isNotEmpty) {
        _page++;
        emit(state.copyWith(
          status: DiscoverTvShowStatus.SUCCESS,
          tvShows: List.of(state.tvShows)..addAll(response),
          hasReachedMax: false,
        ));
      } else {
        emit(state.copyWith(
          status: DiscoverTvShowStatus.SUCCESS,
          hasReachedMax: true,
        ));
      }
    });
  }
}
