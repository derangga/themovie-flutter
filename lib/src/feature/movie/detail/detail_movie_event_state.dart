part of 'detail_movie_bloc.dart';

class DetailMovieState extends BlocState {
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
    content,
    isMovieFavorite,
    apiState,
    errorMessage,
  }) {
    return DetailMovieState(
      content: content ?? this.content,
      isMovieFavorite: isMovieFavorite ?? this.isMovieFavorite,
      apiState: apiState ?? this.apiState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

abstract class DetailMovieEvent implements BlocEvent {}

class GetDetailMovieEvent extends DetailMovieEvent {
  final int movieId;
  GetDetailMovieEvent(this.movieId);
}

class AddOrRemoveFavoriteEvent extends DetailMovieEvent {}
