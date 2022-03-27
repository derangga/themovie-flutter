part of 'trailer_movie_bloc.dart';

abstract class TrailerMovieEvent extends BlocEvent {}

class GetTrailerMovieEvent extends TrailerMovieEvent {
  final int movieId;
  GetTrailerMovieEvent(this.movieId);
}

abstract class TrailerMovieState extends BlocState {}

class LoadingState extends TrailerMovieState {}

class ErrorGetTrailerMovieState extends TrailerMovieState {
  final String? message;
  ErrorGetTrailerMovieState(this.message);
}

class SuccessGetTrailerMovieState extends TrailerMovieState {
  final List<Video> videos;
  SuccessGetTrailerMovieState(this.videos);
}
