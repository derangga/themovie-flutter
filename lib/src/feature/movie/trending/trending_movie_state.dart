part of 'trending_movie_bloc.dart';

/// State
class TrendingMovieState {
  final List<Movie> movies;
  final ApiState apiState;
  final String? errorMessage;

  TrendingMovieState({
    this.movies = const [],
    this.apiState = ApiState.LOADING,
    this.errorMessage,
  });

  TrendingMovieState copyWith({
    List<Movie>? movies,
    ApiState? apiState,
    String? errorMessage,
  }) {
    return TrendingMovieState(
      movies: movies ?? this.movies,
      apiState: apiState ?? this.apiState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
