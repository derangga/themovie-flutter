import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:themovie_flutter/src/feature/video/video_player_state.dart';

class VideoPlayerBloc extends Cubit<VideoPlayerState> {
  VideoPlayerBloc() : super(VideoPlayerState());

  void fullscreen(bool value) {
    emit(state.copyWith(isEnterFullScreen: value));
  }
}
