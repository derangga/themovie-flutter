part of 'trailer_tv_show_bloc.dart';

abstract class TrailerTvShowEvent extends BlocEvent {}

class GetTrailerTvShowEvent extends TrailerTvShowEvent {
  final int tvShowId;
  GetTrailerTvShowEvent(this.tvShowId);
}

// ####################################################

abstract class TrailerTvShowState extends BlocState {}

class LoadingState extends TrailerTvShowState {}

class ErrorGetTrailerTvShowState extends TrailerTvShowState {
  final String? message;
  ErrorGetTrailerTvShowState(this.message);
}

class SuccessGetTrailerTvShowState extends TrailerTvShowState {
  final List<Video> videos;
  SuccessGetTrailerTvShowState(this.videos);
}
