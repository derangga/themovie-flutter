part of 'detail_movie_bloc.dart';

class DetailMovieState {
  final DetailMovieContent? content;
  final bool isMovieFavorite;
  final ApiState apiState;
  final String? errorMessage;
  DetailMovieState({
    this.content,
    this.isMovieFavorite = false,
    this.apiState = ApiState.LOADING,
    this.errorMessage,
  });

  DetailMovieState copyWith({
    DetailMovieContent? content,
    bool? isMovieFavorite,
    ApiState? apiState,
    String? errorMessage,
  }) {
    return DetailMovieState(
      content: content ?? this.content,
      isMovieFavorite: isMovieFavorite ?? this.isMovieFavorite,
      apiState: apiState ?? this.apiState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
