part of 'discover_movie_bloc.dart';

abstract class DiscoverMovieState implements BlocState {}

class SuccessGetDiscoverMovieState implements DiscoverMovieState {
  final Movies movies;
  SuccessGetDiscoverMovieState(this.movies);
}

class ErrorGetDiscoverMovieState implements DiscoverMovieState {
  final String errorMessage;
  ErrorGetDiscoverMovieState(this.errorMessage);
}

abstract class DiscoverMovieEvent implements BlocEvent {}

class GetDiscoverMovieEvent implements DiscoverMovieEvent {}
