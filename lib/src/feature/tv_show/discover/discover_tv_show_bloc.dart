import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/remote/config/failure.dart';
import '../../../data/remote/source/tv_show_remote_source.dart';
import '../../../navigation/tv_show/tv_show_navigation.dart';
import '../../../utils/bloc_throttle.dart';
import '../../../data/model/tv_show.dart';

part 'discover_tv_show_event_state.dart';

class DiscoverTvShowBloc
    extends Bloc<DiscoverTvShowEvent, DiscoverTvShowState> {
  final TvShowRemoteSource _remoteSource;
  final TvShowNavigation _navigation;
  int _page = 1;

  DiscoverTvShowBloc(
    this._remoteSource,
    this._navigation,
  ) : super(DiscoverTvShowState()) {
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
      _page = event.page;
      emit(DiscoverTvShowState());

      final result = await _remoteSource.getDiscoverTvShow(_page);

      _onGetFirstPage(emit, result);
    } else if (event is GetNextPageTvShowEvent) {
      emit(state.copyWith(status: DiscoverTvShowStatus.LOADING));

      final result = await _remoteSource.getDiscoverTvShow(_page);

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

  void goToDetailTvShow(BuildContext context, int tvShowId) {
    _navigation.goToDetailTvShow(context, tvShowId);
  }

  bool isOnLoadingOrFailed() {
    return state.status == DiscoverTvShowStatus.LOADING ||
        state.status == DiscoverTvShowStatus.FAILED;
  }
}
