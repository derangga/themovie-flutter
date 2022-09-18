import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/base_event_state.dart';
import '../../../core/base/base_bloc.dart';
import '../../../data/model/videos.dart';
import '../../../data/remote/tv_show_remote_source.dart';
import '../../../navigation/video/video_navigation.dart';
import '../../../usecase/tv_show/get_trailer_tv_show_usecase.dart';

part 'trailer_tv_show_event_state.dart';

class TrailerTvShowBloc
    extends BaseBloc<TrailerTvShowEvent, TrailerTvShowState> {
  final TvShowRemoteSource _repository;
  final VideoNavigation _navigation;

  TrailerTvShowBloc(
    this._repository,
    this._navigation,
  ) : super(LoadingState()) {
    on<TrailerTvShowEvent>(_fetchTrailer);
  }

  GetTrailerTvShowUseCase get _getTrailerUseCase =>
      GetTrailerTvShowUseCase(_repository);

  Future<void> _fetchTrailer(
    TrailerTvShowEvent event,
    Emitter<TrailerTvShowState> emit,
  ) async {
    if (event is GetTrailerTvShowEvent) {
      emit(LoadingState());

      final result = await _getTrailerUseCase(event.tvShowId);

      result.fold((failure) {
        emit(ErrorGetTrailerTvShowState(failure.message));
      }, (response) {
        emit(SuccessGetTrailerTvShowState(response));
      });
    }
  }

  void goToVideoPlayer(BuildContext context, String videoId, String videoKey) {
    _navigation.goToVideoPlayer(context, videoId, videoKey);
  }
}
