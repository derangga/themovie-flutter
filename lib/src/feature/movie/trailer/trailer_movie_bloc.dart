import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base/base_bloc.dart';
import '../../../core/base/base_event_state.dart';
import '../../../data/model/videos.dart';
import '../../../data/remote/movie_remote_source.dart';
import '../../../navigation/video/video_navigation.dart';
import '../../../usecase/movie/get_trailer_movie_usecase.dart';

part 'trailer_movie_event_state.dart';

class TrailerMovieBloc extends BaseBloc<TrailerMovieEvent, TrailerMovieState> {
  final MovieRemoteSource _remoteSource;
  final VideoNavigation _videoNavigation;

  TrailerMovieBloc(this._remoteSource, this._videoNavigation)
      : super(LoadingState()) {
    on<TrailerMovieEvent>(_fetchTrailer);
  }

  GetTrailerMovieUseCase get _getTrailerUseCase =>
      GetTrailerMovieUseCase(_remoteSource);

  Future<void> _fetchTrailer(
      TrailerMovieEvent event, Emitter<TrailerMovieState> emit) async {
    if (event is GetTrailerMovieEvent) {
      emit(LoadingState());

      final result = await _getTrailerUseCase(event.movieId);

      result.fold((failure) {
        emit(ErrorGetTrailerMovieState(failure.message));
      }, (response) {
        emit(SuccessGetTrailerMovieState(response));
      });
    }
  }

  void goToVideoPlayerScreen(
    BuildContext context,
    String videoId,
    String videoKey,
  ) {
    _videoNavigation.goToVideoPlayer(context, videoId, videoKey);
  }
}
