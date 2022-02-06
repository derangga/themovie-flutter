import 'package:themovie_flutter/src/core/base/base_event_state.dart';
import 'package:themovie_flutter/src/data/model/movie.dart';
import 'package:themovie_flutter/src/data/model/tv_show.dart';

abstract class HomeEvent extends BlocEvent {}

class InitialEvent extends HomeEvent {}

class GetTrendingMovieEvent extends HomeEvent {}

class GetUpcomingMovieEvent extends HomeEvent {}

class GetDiscoverTvShowEvent extends HomeEvent {}

class GetDiscoverMovieEvent extends HomeEvent {}

class ErrorHomeEvent extends HomeEvent {}

abstract class HomeState extends BlocState {}

class InitialState extends HomeState {}

class LoadingState extends HomeState {}

class ShowHomeErrorState extends HomeState {}

class FailedGetMovieState extends HomeState {
  final String? message;
  FailedGetMovieState(this.message);
}

class SuccessGetMovieState extends HomeState {
  final List<Movie> movies;
  SuccessGetMovieState(this.movies);
}

class FailedGetTvShowState extends HomeState {
  final String? message;
  FailedGetTvShowState(this.message);
}

class SuccessGetTvShowState extends HomeState {
  final List<TvShow> tvShows;
  SuccessGetTvShowState(this.tvShows);
}
