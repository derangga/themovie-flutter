import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/api_state.dart';
import '../../../data/model/videos.dart';
import '../../../data/remote/source/movie_remote_source.dart';
import '../../../navigation/video/video_navigation.dart';
import '../../../usecase/movie/get_trailer_movie_usecase.dart';

part 'trailer_movie_state.dart';

class TrailerMovieBloc extends Cubit<TrailerMovieState> {
  final MovieRemoteSource _remoteSource;
  final VideoNavigation _videoNavigation;

  TrailerMovieBloc(this._remoteSource, this._videoNavigation)
      : super(TrailerMovieState());

  GetTrailerMovieUseCase get _getTrailerUseCase =>
      GetTrailerMovieUseCase(_remoteSource);

  Future<void> fetchTrailer(int movieId) async {
    emit(state.copyWith(apiState: ApiState.LOADING));

    final result = await _getTrailerUseCase(movieId);

    result.fold((failure) {
      emit(state.copyWith(
        apiState: ApiState.FAILED,
        errorMessage: failure.message,
      ));
    }, (videoResponse) {
      emit(state.copyWith(
        apiState: ApiState.SUCCESS,
        videos: videoResponse,
      ));
    });
  }

  void goToVideoPlayerScreen(
    BuildContext context,
    String videoId,
    String videoKey,
  ) {
    _videoNavigation.goToVideoPlayer(context, videoId, videoKey);
  }
}
