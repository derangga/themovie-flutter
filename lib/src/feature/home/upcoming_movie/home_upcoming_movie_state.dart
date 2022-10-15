import '../../../core/base/api_state.dart';
import '../../../data/model/movie.dart';

class HomeUpcomingMovieState {
  final List<Movie> movies;
  final ApiState apiState;
  final String? errorMessage;

  HomeUpcomingMovieState({
    this.movies = const [],
    this.apiState = ApiState.LOADING,
    this.errorMessage,
  });

  HomeUpcomingMovieState copyWith({
    List<Movie>? movies,
    ApiState? apiState,
    String? errorMessage,
  }) {
    return HomeUpcomingMovieState(
      movies: movies ?? this.movies,
      apiState: apiState ?? this.apiState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
