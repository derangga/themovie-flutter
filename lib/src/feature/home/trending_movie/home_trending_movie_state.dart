import '../../../core/base/api_state.dart';
import '../../../data/model/movie.dart';

class HomeTrendingMovieState {
  final List<Movie> movies;
  final ApiState apiState;
  final String? errorMessage;
  final int carouselPos;

  HomeTrendingMovieState({
    this.movies = const [],
    this.apiState = ApiState.LOADING,
    this.carouselPos = 0,
    this.errorMessage,
  });

  HomeTrendingMovieState copyWith({
    List<Movie>? movies,
    ApiState? apiState,
    int? carouselPos,
    String? errorMessage,
  }) {
    return HomeTrendingMovieState(
      movies: movies ?? this.movies,
      apiState: apiState ?? this.apiState,
      carouselPos: carouselPos ?? this.carouselPos,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
