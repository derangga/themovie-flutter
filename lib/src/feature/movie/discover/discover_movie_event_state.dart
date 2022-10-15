part of 'discover_movie_bloc.dart';

/// Event

abstract class DiscoverMovieEvent {}

class GetFirstPageMovieEvent extends DiscoverMovieEvent {
  final int page = 1;
}

class GetNextPageMovieEvent extends DiscoverMovieEvent {}

class RetryNextPageEvent extends DiscoverMovieEvent {}

/// State

enum DiscoverMoviesStatus { INITIAL, LOADING, SUCCESS, FAILED }

class DiscoverMovieState {
  final DiscoverMoviesStatus status;
  final List<Movie> movies;
  final bool hasReachedMax;
  final String? errorMessage;

  DiscoverMovieState({
    this.status = DiscoverMoviesStatus.INITIAL,
    this.movies = const [],
    this.hasReachedMax = false,
    this.errorMessage,
  });

  DiscoverMovieState copyWith({
    DiscoverMoviesStatus? status,
    List<Movie>? movies,
    bool? hasReachedMax,
    String? errorMessage,
  }) {
    return DiscoverMovieState(
      status: status ?? this.status,
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      errorMessage: errorMessage,
    );
  }
}
