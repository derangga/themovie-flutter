import 'package:flutter/material.dart';
import 'package:themovie_flutter/src/navigation/route_app.dart';
import 'package:themovie_flutter/src/navigation/tv_show/tv_show_navigation.dart';

class TvShowNavigationImpl extends TvShowNavigation {
  @override
  Future<dynamic> goToDetailTvShow<T>(
    BuildContext context,
    int tvShowId,
  ) async {
    return await Navigator.pushNamed(
      context,
      RouteApp.DETAIL_TV_SCREEN,
      arguments: tvShowId,
    );
  }

  @override
  Future<dynamic> goToDiscoverTvShow(BuildContext context) async {
    return await Navigator.pushNamed(context, RouteApp.DISCOVER_TV_SCREEN);
  }

  @override
  Future<dynamic> goToTrailerTvShow(BuildContext context, int tvShowId) async {
    return await Navigator.pushNamed(context, RouteApp.TRAILER_TV_SHOW_SCREEN);
  }
}
