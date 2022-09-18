import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/navigation/route_app.dart';
import 'package:themovie_flutter/src/navigation/tv_show/tv_show_navigation.dart';

class TvShowNavigationImpl extends TvShowNavigation {
  @override
  void goToDetailTvShow<T>(BuildContext context, int tvShowId) {
    Navigator.pushNamed(
      context,
      RouteApp.DETAIL_TV_SCREEN,
      arguments: tvShowId,
    );
  }

  @override
  void goToDiscoverTvShow(BuildContext context) {
    Navigator.pushNamed(context, RouteApp.DISCOVER_TV_SCREEN);
  }

  @override
  void goToTrailerTvShow(BuildContext context, int tvShowId) {
    Navigator.pushNamed(context, RouteApp.TRAILER_TV_SHOW_SCREEN);
  }
}
