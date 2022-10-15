import 'package:themovie_flutter/src/core/base/api_state.dart';

import '../../../data/model/tv_show.dart';

class HomeDiscoverTvShowState {
  final List<TvShow> tvShows;
  final ApiState apiState;
  final String? errorMessage;

  HomeDiscoverTvShowState({
    this.tvShows = const [],
    this.apiState = ApiState.LOADING,
    this.errorMessage,
  });

  HomeDiscoverTvShowState copyWith({
    List<TvShow>? tvShows,
    ApiState? apiState,
    String? errorMessage,
  }) {
    return HomeDiscoverTvShowState(
      tvShows: tvShows ?? this.tvShows,
      apiState: apiState ?? this.apiState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
