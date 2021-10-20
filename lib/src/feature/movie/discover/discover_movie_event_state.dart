part of 'discover_movie_bloc.dart';

/// Event

abstract class DiscoverMovieEvent implements BlocEvent {}

class GetFirstPageMovieEvent extends DiscoverMovieEvent {
  final int page = 1;
}

class GetNextPageMovieEvent extends DiscoverMovieEvent {}

class RetryNextPageEvent extends DiscoverMovieEvent {}

/// State

abstract class DiscoverMovieState extends BlocState {}

class LoadingFirstPageState extends DiscoverMovieState {}

class LoadingRetryNextPageState extends DiscoverMovieState {
  final List<Movie> movies;
  LoadingRetryNextPageState(this.movies);

  copyWith({List<Movie> nextMovies, bool hasReachedMax}) {
    return LoadingRetryNextPageState(nextMovies ?? this.movies);
  }
}

class ErrorGetFirstPageMovieState extends DiscoverMovieState {
  final String message;
  ErrorGetFirstPageMovieState(this.message);
}

class ErrorGetNextPageMovieState extends DiscoverMovieState {
  final String message;
  final List<Movie> movies;
  ErrorGetNextPageMovieState(this.movies, this.message);
  copyWith({List<Movie> nextMovies, bool hasReachedMax}) {
    return ErrorGetNextPageMovieState(
        nextMovies ?? this.movies, message ?? this.message);
  }
}

class SuccessGetDiscoverMovieState extends DiscoverMovieState {
  final List<Movie> movies;
  final bool hasReachedMax;
  SuccessGetDiscoverMovieState(this.movies, this.hasReachedMax);

  copyWith({List<Movie> nextMovies, bool hasReachedMax}) {
    return SuccessGetDiscoverMovieState(
        nextMovies ?? this.movies, hasReachedMax ?? this.hasReachedMax);
  }
}
