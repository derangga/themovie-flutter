import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/base_bloc.dart';
import '../../../core/base/base_event_state.dart';
import '../../../data/model/detail_tv_show_content.dart';
import '../../../data/remote/tv_show_remote_source.dart';
import '../../../navigation/tv_show/tv_show_navigation.dart';
import '../../../usecase/tv_show/get_detail_tv_show_usecase.dart';

part 'detail_tv_show_event_state.dart';

class DetailTvShowBloc extends BaseBloc<DetailTvShowEvent, DetailTvShowState> {
  final TvShowRemoteSource _remoteSouce;
  final TvShowNavigation _navigation;
  DetailTvShowBloc(
    this._remoteSouce,
    this._navigation,
  ) : super(LoadingState()) {
    on<DetailTvShowEvent>(_fetchDetailTvShow);
  }

  Future<void> _fetchDetailTvShow(
    DetailTvShowEvent event,
    Emitter<DetailTvShowState> emit,
  ) async {
    if (event is GetDetailTvShowEvent) {
      emit(LoadingState());

      final result = await _getDetailTvShow(event.tvShowId);

      result.fold((failure) {
        emit(ErrorGetDetailTvShowState('${failure.message}'));
      }, (success) {
        emit(SuccessGetDetailTvShowState(success));
      });
    }
  }

  void goToTrailerTvShow(BuildContext context, int tvShowId) {
    _navigation.goToTrailerTvShow(context, tvShowId);
  }

  void goToDetailTvShow(BuildContext context, int tvShowId) {
    _navigation.goToDetailTvShow(context, tvShowId);
  }

  GetDetailTvShowUseCase get _getDetailTvShow =>
      GetDetailTvShowUseCase(_remoteSouce);
}
