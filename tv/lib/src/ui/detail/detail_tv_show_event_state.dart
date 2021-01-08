part of 'detail_tv_show_bloc.dart';

abstract class DetailTvShowEvent extends BlocEvent {}

class GetDetailTvShowEvent extends DetailTvShowEvent {
  final tvShowId;
  GetDetailTvShowEvent(this.tvShowId);
}

abstract class DetailTvShowState extends BlocState {}

class LoadingState extends DetailTvShowState {}

class SuccessGetDetailTvShowState extends DetailTvShowState {
  final DetailTvShowContent detailTvShowContent;
  SuccessGetDetailTvShowState(this.detailTvShowContent);
}

class ErrorGetDetailTvShowState extends DetailTvShowState {
  final String message;
  ErrorGetDetailTvShowState(this.message);
}
