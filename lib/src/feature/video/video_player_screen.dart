import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:themovie_flutter/src/navigation/screen_args/video_player_arguments.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../resources/color_theme.dart';
import '../../widget/dark_app_bar.dart';

class VideoPlayerScreen extends StatefulWidget {
  final VideoPlayerArguments videoArgs;
  const VideoPlayerScreen(this.videoArgs, {Key? key}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoArgs.videoKey,
      params: YoutubePlayerParams(
        showFullscreenButton: true,
        privacyEnhanced: true,
        autoPlay: true,
        desktopMode: true,
        enableCaption: false,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    };
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerControllerProvider(
      controller: _controller,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: DarkAppBar(
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
          child: YoutubePlayerIFrame(
            aspectRatio: 16 / 9,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
