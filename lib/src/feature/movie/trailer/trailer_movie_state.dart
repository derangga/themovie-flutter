part of 'trailer_movie_bloc.dart';

class TrailerMovieState {
  final List<Video> videos;
  final ApiState apiState;
  final String? errorMessage;

  TrailerMovieState({
    this.videos = const [],
    this.apiState = ApiState.LOADING,
    this.errorMessage,
  });

  TrailerMovieState copyWith({
    List<Video>? videos,
    ApiState? apiState,
    String? errorMessage,
  }) {
    return TrailerMovieState(
      videos: videos ?? this.videos,
      apiState: apiState ?? this.apiState,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
