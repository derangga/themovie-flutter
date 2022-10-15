import 'package:flutter/material.dart';

abstract class VideoNavigation {
  Future<dynamic> goToVideoPlayer(
    BuildContext context,
    String videoId,
    String videoKey,
  );
}
