part of 'trending_movie_bloc.dart';

/// Event
abstract class TrendingMovieEvent extends BlocEvent {}

class GetTrendingMovieEvent extends TrendingMovieEvent {}

/// State
abstract class TrendingMovieState extends BlocState {}

class LoadingState extends TrendingMovieState {}

class SuccessGetMovieState extends TrendingMovieState {
  final List<Movie> movies;
  SuccessGetMovieState(this.movies);
}

class FailedGetMovieState extends TrendingMovieState {
  final String? message;
  FailedGetMovieState(this.message);
}
