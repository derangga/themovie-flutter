import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/base_bloc.dart';
import '../../../data/remote/tv_show_remote_source.dart';
import '../../../navigation/tv_show/tv_show_navigation.dart';
import '../../../usecase/tv_show/get_discover_tv_show_usecase.dart';
import '../home_event_state.dart';

class HomeDiscoverTvShowBloc extends BaseBloc<HomeEvent, HomeState> {
  final TvShowRemoteSource _remoteSource;
  final TvShowNavigation _navigation;

  HomeDiscoverTvShowBloc(
    this._remoteSource,
    this._navigation,
  ) : super(LoadingState()) {
    on<HomeEvent>(_fetchDiscoverTvShow);
  }

  Future<void> _fetchDiscoverTvShow(
    HomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (event is GetDiscoverTvShowEvent) {
      emit(LoadingState());

      final result = await _getDiscoverTvShow(1);

      result.fold((failure) {
        emit(FailedGetTvShowState(failure.message));
      }, (response) {
        emit(SuccessGetTvShowState(response));
      });
    } else if (event is InitialEvent) {
      emit(LoadingState());
    }
  }

  GetDiscoverTvShowUseCase get _getDiscoverTvShow =>
      GetDiscoverTvShowUseCase(_remoteSource);

  void goToDiscoverTvShow(BuildContext context) {
    _navigation.goToDiscoverTvShow(context);
  }

  void goToDetailTvShow(BuildContext context, int tvShowId) {
    _navigation.goToDetailTvShow(context, tvShowId);
  }
}
