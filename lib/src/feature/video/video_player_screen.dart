import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:themovie_flutter/src/feature/video/video_player_bloc.dart';
import 'package:themovie_flutter/src/feature/video/video_player_state.dart';
import 'package:themovie_flutter/src/navigation/screen_args/video_player_arguments.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../core/base/base_cubit_widget.dart';
import '../../resources/color_theme.dart';
import '../../widget/dark_app_bar.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoPlayerArguments videoArgs;
  const VideoPlayerScreen(this.videoArgs, {Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends BaseCubitWidget<VideoPlayerBloc,
    VideoPlayerState, VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  final logger = Logger('VideoPlayerScreen');

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: widget.videoArgs.videoKey,
      autoPlay: true,
      params: YoutubePlayerParams(showFullscreenButton: true),
    );
    _controller.setFullScreenListener((value) {
      bloc.fullscreen(value);
    });
  }

  @override
  Widget mapStateHandler(VideoPlayerState state) {
    return SafeArea(
      child: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) return;
          if (!state.isEnterFullScreen) return;

          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
          ]);
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: state.isEnterFullScreen
              ? null
              : DarkAppBar(
                  title: Text('Trailer'),
                  leading: Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: ShapeDecoration(
                        shape: CircleBorder(), color: ColorTheme.primaryDark),
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_rounded),
                        onPressed: () => Navigator.pop(context)),
                  ),
                ),
          body: Center(
            child: YoutubePlayerScaffold(
              controller: _controller,
              builder: (context, player) {
                return Center(
                  child: player,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<VideoPlayerBloc, VideoPlayerState>(
        builder: (context, state) => mapStateHandler(state),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
