part of 'detail_movie_bloc.dart';

abstract class DetailMovieState implements BlocState {}

class LoadingState extends DetailMovieState {}

class SuccessGetDetailMovie extends DetailMovieState {
  final DetailMovieContent content;
  SuccessGetDetailMovie(this.content);
}

class ErrorGetDetailMovie extends DetailMovieState {
  final String? message;
  ErrorGetDetailMovie(this.message);
}

abstract class DetailMovieEvent implements BlocEvent {}

class GetDetailMovieEvent extends DetailMovieEvent {
  final int movieId;
  GetDetailMovieEvent(this.movieId);
}
