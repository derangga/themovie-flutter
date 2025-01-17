class VideoPlayerState {
  bool isEnterFullScreen;
  VideoPlayerState({this.isEnterFullScreen = false});

  VideoPlayerState copyWith({
    bool? isEnterFullScreen,
  }) {
    return VideoPlayerState(
      isEnterFullScreen: isEnterFullScreen ?? this.isEnterFullScreen,
    );
  }
}
