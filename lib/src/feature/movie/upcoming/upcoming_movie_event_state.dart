part of 'upcoming_movie_bloc.dart';

/// Event
abstract class UpcomingMovieEvent extends BlocEvent {}

class GetFirstPageMovieEvent extends UpcomingMovieEvent {
  final int page = 1;
}

class GetNextPageMovieEvent extends UpcomingMovieEvent {}

class RetryNextPageEvent extends UpcomingMovieEvent {}

/// State
enum UpcomingMovieStatus { INITIAL, LOADING, SUCCESS, FAILED }

class UpcomingMovieState extends BlocState {
  final UpcomingMovieStatus status;
  final List<Movie> movies;
  final bool hasReachedMax;
  final String? errorMessage;

  UpcomingMovieState({
    this.status = UpcomingMovieStatus.INITIAL,
    this.movies = const [],
    this.hasReachedMax = false,
    this.errorMessage,
  });

  UpcomingMovieState copyWith({
    UpcomingMovieStatus? status,
    List<Movie>? movies,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return UpcomingMovieState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage,
    );
  }
}
