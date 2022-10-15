import 'package:themovie_flutter/src/core/base/api_state.dart';

import '../../../data/model/movie.dart';

class HomeDiscoverMovieState {
  final List<Movie> movies;
  final ApiState apiState;
  final String? errorMessage;

  HomeDiscoverMovieState({
    this.movies = const [],
    this.apiState = ApiState.LOADING,
    this.errorMessage,
  });

  HomeDiscoverMovieState copyWith({
    List<Movie>? movies,
    ApiState? apiState,
    String? errorMessage,
  }) {
    return HomeDiscoverMovieState(
      movies: movies ?? this.movies,
      apiState: apiState ?? this.apiState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
