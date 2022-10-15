import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/core/base/api_state.dart';
import '../../../data/model/videos.dart';
import '../../../data/remote/tv_show_remote_source.dart';
import '../../../navigation/video/video_navigation.dart';
import '../../../usecase/tv_show/get_trailer_tv_show_usecase.dart';

part 'trailer_tv_show_event_state.dart';

class TrailerTvShowBloc extends Cubit<TrailerTvShowState> {
  final TvShowRemoteSource _repository;
  final VideoNavigation _navigation;

  TrailerTvShowBloc(
    this._repository,
    this._navigation,
  ) : super(TrailerTvShowState());

  GetTrailerTvShowUseCase get _getTrailerUseCase =>
      GetTrailerTvShowUseCase(_repository);

  Future<void> fetchTrailer(int tvShowId) async {
    emit(state.copyWith(apiState: ApiState.LOADING));

    final result = await _getTrailerUseCase(tvShowId);

    result.fold((failure) {
      emit(state.copyWith(
        apiState: ApiState.FAILED,
        errorMessage: failure.message,
      ));
    }, (videosResponse) {
      emit(state.copyWith(
        apiState: ApiState.SUCCESS,
        videos: videosResponse,
      ));
    });
  }

  void goToVideoPlayer(BuildContext context, String videoId, String videoKey) {
    _navigation.goToVideoPlayer(context, videoId, videoKey);
  }
}
