part of 'discover_movie_bloc.dart';

abstract class DiscoverMovieState implements BlocState {}

class SuccessGetDiscoverMovieState implements DiscoverMovieState {
  final List<Movie> movies;
  SuccessGetDiscoverMovieState(this.movies);
}

class ErrorGetDiscoverMovieState implements DiscoverMovieState {
  final SingleSourceFailure<List<Movie>> errorData;
  ErrorGetDiscoverMovieState(this.errorData);
}

abstract class DiscoverMovieEvent implements BlocEvent {}

class GetDiscoverMovieEvent implements DiscoverMovieEvent {}
