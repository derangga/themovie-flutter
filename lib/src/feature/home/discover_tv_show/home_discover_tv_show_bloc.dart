import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/api_state.dart';

import '../../../data/remote/source/tv_show_remote_source.dart';
import '../../../navigation/tv_show/tv_show_navigation.dart';
import '../../../usecase/tv_show/get_discover_tv_show_usecase.dart';
import 'home_discover_tv_show_state.dart';

class HomeDiscoverTvShowBloc extends Cubit<HomeDiscoverTvShowState> {
  final TvShowRemoteSource _remoteSource;
  final TvShowNavigation _navigation;

  HomeDiscoverTvShowBloc(
    this._remoteSource,
    this._navigation,
  ) : super(HomeDiscoverTvShowState());

  Future<void> fetchDiscoverTvShow() async {
    emit(state.copyWith(apiState: ApiState.LOADING));

    final result = await _getDiscoverTvShow(1);

    result.fold((failure) {
      emit(state.copyWith(
        apiState: ApiState.FAILED,
        errorMessage: failure.message,
      ));
    }, (tvShowsResponse) {
      emit(state.copyWith(
        apiState: ApiState.SUCCESS,
        tvShows: tvShowsResponse,
      ));
    });
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
