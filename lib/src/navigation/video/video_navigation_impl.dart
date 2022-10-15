import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/navigation/route_app.dart';
import 'package:themovie_flutter/src/navigation/video/video_navigation.dart';

import '../screen_args/video_player_arguments.dart';

class VideoNavigationImpl extends VideoNavigation {
  @override
  Future<dynamic> goToVideoPlayer(
    BuildContext context,
    String videoId,
    String videoKey,
  ) async {
    final params = VideoPlayerArguments(videoId, videoKey);
    return await Navigator.pushNamed(
      context,
      RouteApp.VIDEO_PLAYER_SCREEN,
      arguments: params,
    );
  }
}
