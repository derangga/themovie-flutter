part of 'detail_tv_show_bloc.dart';

abstract class DetailTvShowEvent extends BlocEvent {}

class GetDetailTvShowEvent extends DetailTvShowEvent {
  final tvShowId;
  GetDetailTvShowEvent(this.tvShowId);
}

abstract class DetailTvShowState extends BlocState {}

class SuccessGetDetailTvShowState extends DetailTvShowState {}

class ErrorGetDetailTvShowState extends DetailTvShowState {}
